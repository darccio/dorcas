"""Module extension for Orchestrion."""

load("//tools/orchestrion:repository.bzl", "orchestrion_build")

def _orchestrion_impl(ctx):
    """Implementation of the orchestrion module extension."""
    for mod in ctx.modules:
        for build in mod.tags.build:
            orchestrion_build(
                name = "com_github_datadog_orchestrion",
                version = build.version,
            )

_build_tag = tag_class(
    attrs = {
        "version": attr.string(
            mandatory = True,
            doc = "The version of Orchestrion to build",
        ),
    },
    doc = "Build Orchestrion from source at the specified version.",
)

orchestrion = module_extension(
    implementation = _orchestrion_impl,
    tag_classes = {
        "build": _build_tag,
    },
    doc = """
Module extension for building Orchestrion.

Usage in MODULE.bazel:

    # Build orchestrion
    orchestrion_build = use_extension("//tools/orchestrion:extensions.bzl", "orchestrion")
    orchestrion_build.build(version = "v1.5.0")
    use_repo(orchestrion_build, "com_github_datadog_orchestrion")

    # Configure rules_go to use it
    orchestrion_config = use_extension("@rules_go//go:extensions.bzl", "orchestrion")
    orchestrion_config.configure(tool = "@com_github_datadog_orchestrion//:orchestrion")
""",
)

