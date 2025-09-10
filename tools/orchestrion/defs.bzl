"""Orchestrion wrapper rules for go_binary and go_test."""

load("//tools/orchestrion:transition.bzl", "orch_transition")

def _first_target(dep):
    if type(dep) == "list":
        if len(dep) == 0:
            fail("actual produced no targets")
        return dep[0]
    return dep

def _dep_exec_and_runfiles(dep):
    t = _first_target(dep)
    di = t[DefaultInfo]
    return di.files_to_run.executable, di.default_runfiles.merge(di.data_runfiles)

def _fwd_bin_impl(ctx):
    dep_exe, dep_runfiles = _dep_exec_and_runfiles(ctx.attr.actual)
    out = ctx.actions.declare_file(ctx.label.name)
    ctx.actions.symlink(output = out, target_file = dep_exe)

    # If orchestrion_tool is provided, set ORCHESTRION_BIN environment variable
    # This will be picked up by the orch_env_and_tools function in rules_go
    env = {}
    runfiles_files = []
    if ctx.attr.orchestrion_tool:
        env["ORCHESTRION_BIN"] = ctx.executable.orchestrion_tool.path
        runfiles_files.append(ctx.executable.orchestrion_tool)

    # Merge with the actual target's runfiles
    merged_runfiles = dep_runfiles.merge(ctx.runfiles(files = runfiles_files))

    return [DefaultInfo(
        files = depset([out]),
        runfiles = merged_runfiles,
        executable = out,
    )]

orch_go_binary = rule(
    implementation = _fwd_bin_impl,
    attrs = {
        "actual": attr.label(mandatory = True, executable = True, cfg = orch_transition),
        "orchestrion_tool": attr.label(executable = True, cfg = "exec"),
        "_allowlist_function_transition": attr.label(
            default = "@bazel_tools//tools/allowlists/function_transition_allowlist",
        ),
    },
    executable = True,
)

def _fwd_test_impl(ctx):
    dep_exe, dep_runfiles = _dep_exec_and_runfiles(ctx.attr.actual)
    out = ctx.actions.declare_file(ctx.label.name)
    ctx.actions.symlink(output = out, target_file = dep_exe)
    return [DefaultInfo(
        files = depset([out]),
        runfiles = dep_runfiles,
        executable = out,
    )]

orch_go_test = rule(
    implementation = _fwd_test_impl,
    attrs = {
        "actual": attr.label(mandatory = True, cfg = orch_transition),
        "orchestrion_tool": attr.label(executable = True, cfg = "exec"),
        "_allowlist_function_transition": attr.label(
            default = "@bazel_tools//tools/allowlists/function_transition_allowlist",
        ),
    },
    test = True,
)