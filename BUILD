load("@gazelle//:def.bzl", "gazelle")
load("@rules_go//go:def.bzl", "go_binary", "go_library")
load("//tools/orchestrion:defs.bzl", "orch_go_binary")

gazelle(name = "gazelle")

go_binary(
    name = "subject",
    embed = [":subject_lib"],
    visibility = ["//visibility:private"],
)

go_library(
    name = "subject_lib",
    srcs = ["main.go"],
    # We need to pass this in a hidden way when orchestrion is enabled
    orchestrion_tool = "@com_github_datadog_orchestrion//:orchestrion",
    importpath = "datadoghq.com/x/dorcas/subject",
    visibility = ["//visibility:private"],
)

orch_go_binary(
    name = "subject_orch",
    actual = ":subject",
    visibility = ["//visibility:public"],
)
