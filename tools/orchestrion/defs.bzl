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

    # Collect runfiles from the actual target and orchestrion tool
    runfiles_files = []
    
    if ctx.attr.orchestrion_tool:
        # Include the orchestrion binary and its runfiles
        orch_info = ctx.attr.orchestrion_tool[DefaultInfo]
        runfiles_files.extend(orch_info.files.to_list())
        
        # Merge with orchestrion's runfiles
        orch_runfiles = orch_info.default_runfiles
        merged_runfiles = dep_runfiles.merge(ctx.runfiles(files = runfiles_files)).merge(orch_runfiles)
    else:
        merged_runfiles = dep_runfiles

    return [DefaultInfo(
        files = depset([out]),
        runfiles = merged_runfiles,
        executable = out,
    )]

orch_go_binary = rule(
    implementation = _fwd_bin_impl,
    attrs = {
        "actual": attr.label(
            mandatory = True,
            executable = True,
            cfg = orch_transition,
            doc = "The go_binary target to instrument with Orchestrion.",
        ),
        "orchestrion_tool": attr.label(
            executable = True,
            cfg = "exec",
            doc = "The Orchestrion binary to use for instrumentation.",
        ),
        "_allowlist_function_transition": attr.label(
            default = "@bazel_tools//tools/allowlists/function_transition_allowlist",
        ),
    },
    executable = True,
    doc = """
Wraps a go_binary target to enable Orchestrion instrumentation.

This rule applies a configuration transition to enable the Orchestrion
build setting in rules_go, and includes the Orchestrion binary in runfiles.

Example:
    orch_go_binary(
        name = "my_binary_instrumented",
        actual = ":my_binary",
        orchestrion_tool = "@com_github_datadog_orchestrion//:orchestrion",
    )
""",
)

def _fwd_test_impl(ctx):
    dep_exe, dep_runfiles = _dep_exec_and_runfiles(ctx.attr.actual)
    out = ctx.actions.declare_file(ctx.label.name)
    ctx.actions.symlink(output = out, target_file = dep_exe)
    
    # Collect runfiles from orchestrion tool if provided
    runfiles_files = []
    
    if ctx.attr.orchestrion_tool:
        orch_info = ctx.attr.orchestrion_tool[DefaultInfo]
        runfiles_files.extend(orch_info.files.to_list())
        orch_runfiles = orch_info.default_runfiles
        merged_runfiles = dep_runfiles.merge(ctx.runfiles(files = runfiles_files)).merge(orch_runfiles)
    else:
        merged_runfiles = dep_runfiles

    return [DefaultInfo(
        files = depset([out]),
        runfiles = merged_runfiles,
        executable = out,
    )]

orch_go_test = rule(
    implementation = _fwd_test_impl,
    attrs = {
        "actual": attr.label(
            mandatory = True,
            cfg = orch_transition,
            doc = "The go_test target to instrument with Orchestrion.",
        ),
        "orchestrion_tool": attr.label(
            executable = True,
            cfg = "exec",
            doc = "The Orchestrion binary to use for instrumentation.",
        ),
        "_allowlist_function_transition": attr.label(
            default = "@bazel_tools//tools/allowlists/function_transition_allowlist",
        ),
    },
    test = True,
    doc = """
Wraps a go_test target to enable Orchestrion instrumentation.

Example:
    orch_go_test(
        name = "my_test_instrumented",
        actual = ":my_test",
        orchestrion_tool = "@com_github_datadog_orchestrion//:orchestrion",
    )
""",
)
