load("@rules_cc//cc:defs.bzl", "cc_library")
load("PATCH_VERSION.bzl", "PATCH_VERSION")
load(":expand_tpl.bzl", "expand_tpl")     

expand_tpl(
    name = "genver",
    template = "version.h.in",
    substitutions = {
        "@PROJECT_VERSION_PATCH@": PATCH_VERSION,
    },
)

cc_library(
    name = "helloworld",
    srcs = ["lib.cpp"],
    hdrs = ["lib.h", ":genver"],
    copts = ["-I$(GENDIR)/version"],
    visibility = ["//main:__pkg__", "//test:__pkg__"],
)
