load("@rules_pkg//pkg:deb.bzl", "pkg_deb")
load("@rules_pkg//pkg:tar.bzl", "pkg_tar")
load(":my_package_name.bzl", "basic_naming")

# attempt to use rules_pkg, no success, but leave here for future reference

VERSION = "1"
REVISION = "2"

basic_naming(
    name = "my_naming_vars",

    version = VERSION,
    revision = REVISION,
)

names_from_toolchains = rule(
    implementation = _names_from_toolchains_impl,
    attrs = {
        "_cc_toolchain": attr.label(
            default = Label(
                "@rules_cc//cc:current_cc_toolchain",
            ),
        ),
    },
    toolchains = ["@rules_cc//cc:toolchain_type"],
)

pkg_deb(
    name = "a_deb_package",
    data = ":example1",
    package = "helloworld",
    maintainer = "Sergey Spiridonov <sena73@ya.ru>",
    # Note: target_cpu comes from the --cpu on the command line, and dows not
    # have to be stated in the BUILD file.
    package_file_name = "helloworld_{version}-{revision}_{target_cpu}.deb",
    package_variables = ":my_naming_vars",
    version = VERSION,
)

pkg_tar(
    name = "example1",
    srcs = [
        ":BUILD",
    ],
    package_file_name = "example1-{product_name}-{target_cpu}-{compilation_mode}{special_build}.tar",
    package_variables = ":my_naming_vars",
)
