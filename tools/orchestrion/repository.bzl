"""Repository rule for building Orchestrion from source (macOS and Linux only)."""

def _orchestrion_build_impl(ctx):
    """Builds Orchestrion from source using go build."""
    
    binary_name = "orchestrion_bin"
    wrapper_name = "orchestrion.sh"
    
    # Use Go to build orchestrion
    version = ctx.attr.version
    if not version.startswith("v"):
        version = "v" + version
    
    module_path = "github.com/DataDog/orchestrion@" + version
    
    # Find the Go binary
    go_bin = ctx.which("go")
    if not go_bin:
        fail("Could not find 'go' in PATH. Please ensure Go is installed.")
    
    # Create a temporary directory for GOPATH/GOCACHE
    cache_dir = str(ctx.path(".")) + "/.cache"
    gopath_dir = str(ctx.path(".")) + "/.gopath"
    
    # Environment for deterministic builds
    env = {
        "GO111MODULE": "on",
        "GOPATH": gopath_dir,
        "GOCACHE": cache_dir + "/go-build",
        "GOMODCACHE": cache_dir + "/mod",
        "GOTOOLCHAIN": "local",
        "GOTELEMETRY": "off",
        "GOPROXY": "https://proxy.golang.org,direct",
    }
    
    # Build orchestrion
    result = ctx.execute(
        [
            go_bin,
            "install",
            module_path,
        ],
        environment = env,
        quiet = False,
        timeout = 600,
    )
    
    if result.return_code != 0:
        fail("Failed to build orchestrion:\nstdout: {}\nstderr: {}".format(
            result.stdout,
            result.stderr,
        ))
    
    # The binary is installed to GOPATH/bin
    installed_binary = gopath_dir + "/bin/orchestrion"
    
    # Copy the binary to the repository root
    ctx.execute(["cp", installed_binary, binary_name])
    ctx.execute(["chmod", "+x", binary_name])
    
    # Create a wrapper script that uses runfiles properly
    wrapper_content = """#!/bin/bash
# --- begin runfiles.bash initialization v3 ---
set -euo pipefail
if [[ -n "${{RUNFILES_DIR:-}}" ]]; then
    RUNFILES="${{RUNFILES_DIR}}"
elif [[ -d "$0.runfiles" ]]; then
    RUNFILES="$0.runfiles"
elif [[ -d "${{BASH_SOURCE[0]}}.runfiles" ]]; then
    RUNFILES="${{BASH_SOURCE[0]}}.runfiles"
else
    # Fall back to looking for the binary next to the script
    SCRIPT_DIR="$(cd "$(dirname "${{BASH_SOURCE[0]}}")" && pwd)"
    if [[ -x "$SCRIPT_DIR/{binary}" ]]; then
        exec "$SCRIPT_DIR/{binary}" "$@"
    fi
    echo "ERROR: Cannot find runfiles directory" >&2
    exit 1
fi
# --- end runfiles.bash initialization v3 ---
exec "$RUNFILES/+orchestrion+com_github_datadog_orchestrion/{binary}" "$@"
""".format(binary = binary_name)
    
    ctx.file(wrapper_name, wrapper_content, executable = True)
    
    # Create the BUILD file
    ctx.file("BUILD.bazel", """
# Auto-generated BUILD file for Orchestrion binary
package(default_visibility = ["//visibility:public"])

sh_binary(
    name = "orchestrion",
    srcs = ["{wrapper}"],
    data = ["{binary}"],
)

filegroup(
    name = "orchestrion_files",
    srcs = [
        "{binary}",
        "{wrapper}",
    ],
)
""".format(binary = binary_name, wrapper = wrapper_name))
    
    ctx.file("WORKSPACE", "")

orchestrion_build = repository_rule(
    implementation = _orchestrion_build_impl,
    attrs = {
        "version": attr.string(
            mandatory = True,
            doc = "The version of Orchestrion to build (e.g., 'v1.5.0' or '1.5.0')",
        ),
    },
    doc = """
Repository rule that builds Orchestrion from source (macOS and Linux only).

This rule downloads and builds the Orchestrion binary using `go install`,
creating a deterministic build environment with explicit Go settings.

Example:
    orchestrion_build(
        name = "com_github_datadog_orchestrion",
        version = "v1.5.0",
    )
""",
    environ = ["PATH"],
)
