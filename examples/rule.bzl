
_CONTENT_PREFIX = "#!/usr/bin/env bash\n"

def _myrule(ctx):
    content = []
    for f in ctx.files.stamp_files:
        content.append("echo $(cat %s)" % f.short_path)
    
    out_file = ctx.actions.declare_file(ctx.label.name + ".bash")
    ctx.actions.write(
        output = out_file,
        content = _CONTENT_PREFIX + "\n".join(content),
        is_executable = True,
    )

    return [
        DefaultInfo(
            files = depset([out_file]),
            runfiles = ctx.runfiles(
                files = ctx.files.stamp_files,
            ),
            executable = out_file,
        )
    ]

myrule = rule(
    implementation = _myrule,
    attrs = {
        "stamp_files": attr.label(),
    },
    executable = True,
)