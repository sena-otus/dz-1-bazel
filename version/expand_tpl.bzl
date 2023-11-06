def expand_tpl(**kwargs):
    _expand_tpl(
        source_file = "{template}".format(**kwargs)[0:-3],
        **kwargs
    )


def _expand_tpl_impl(ctx):
#    print("analyzing", ctx.label)
#    out = ctx.actions.declare_file(ctx.label.source_file)
    out = ctx.outputs.source_file
    ctx.actions.expand_template(
        output = out,
        template = ctx.file.template,
        substitutions = ctx.attr.substitutions,
    )
    return [DefaultInfo(files = depset([out]))]

_expand_tpl = rule(
    implementation = _expand_tpl_impl,
    attrs = {
        "substitutions": attr.string_dict(),
        "template" : attr.label(
            allow_single_file = True,     
        ),
        "source_file": attr.output(mandatory = True),
    },
)
