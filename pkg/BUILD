load("@rules_pkg//pkg:deb.bzl", "pkg_deb")
load("@rules_pkg//pkg:tar.bzl", "pkg_tar")
load("//version:PATCH_VERSION.bzl", "PATCH_VERSION")

pkg_tar(
    name = "helloworld-tar",
    strip_prefix = "/main",
    package_dir = "/usr/bin",
    extension = "tar.gz",
    srcs = ["//main:helloworld_cli"],
    mode = "0755",
)

pkg_deb(
    name = "helloworld-debian",
    architecture = "amd64",
    data = ":helloworld-tar",
    depends = [
        "zlib1g-dev",
        "unzip",
    ],
    description = "that is a helloworld app build with bazel",
    homepage = "https://github.com/sena-otus/dz-1-bazel",
    maintainer = "sena73@ya.ru",
    package = "helloworld",
    version = "0.0."+PATCH_VERSION,
)
