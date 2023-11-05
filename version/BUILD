load("@rules_cc//cc:defs.bzl", "cc_library")

#$(PROJECT_VERSION_PATCH)
genrule(
    name = "generate_version_header",
    srcs = ["version.h.in"],
    outs = ["version.h"],
    cmd = """
        cat $< | sed 's/@PROJECT_VERSION_PATCH@/1/' > $@
    """,
#    tools = ["@bazel_tools//tools/text:cat", "@bazel_tools//tools/defaults:sed"],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "helloworld",
    srcs = ["lib.cpp"],
    hdrs = ["lib.h", ":generate_version_header"],
    copts = ["-I$(GENDIR)/version"],
    visibility = ["//main:__pkg__", "//test:__pkg__"],
)
