cc_test(
    name = "gtest_version",
    size = "small",
    srcs = ["gtest_version.cpp"],
    copts = ["-Iexternal/gtest/include"],
    deps = [
        "@gtest//:gtest_main",
	    "//version:helloworld", 
    ],
)
