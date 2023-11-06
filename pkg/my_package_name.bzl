
load("@rules_pkg//pkg:providers.bzl", "PackageVariablesInfo")
load("@rules_cc//cc:find_cc_toolchain.bzl", "find_cc_toolchain")

def _basic_naming_impl(ctx):
    values = {}

    # Copy attributes from the rule to the provider
    values["product_name"] = ctx.attr.product_name
    values["version"] = ctx.attr.version
    values["revision"] = ctx.attr.revision
    values["special_build"] = ctx.attr.special_build

    # Add some well known variables from the rule context.
    values["target_cpu"] = ctx.var.get("TARGET_CPU")
    values["compilation_mode"] = ctx.var.get("COMPILATION_MODE")

    return PackageVariablesInfo(values = values)

#
# A rule to inject variables from the build file into package names.
#
basic_naming = rule(
    implementation = _basic_naming_impl,
    attrs = {
        "product_name": attr.string(
            doc = "Placeholder for our final product name.",
        ),
        "revision": attr.string(
            doc = "Placeholder for our release revision.",
        ),
        "version": attr.string(
            doc = "Placeholder for our release version.",
        ),
        "special_build": attr.string(
            doc = "Indicates that we have built with a 'special' option.",
        ),
    },
)
