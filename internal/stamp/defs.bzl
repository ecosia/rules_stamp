def _stamp_resolve(ctx, string, output):
    stamps = [ctx.info_file, ctx.version_file]
    stamp_args = [
        "--stamp-info-file=%s" % sf.path
        for sf in stamps
    ]
    ctx.actions.run(
        executable = ctx.executable._stamper,
        arguments = [
            "--format=%s" % string,
            "--output=%s" % output.path,
        ] + stamp_args,
        inputs = stamps,
        tools = [ctx.executable._stamper],
        outputs = [output],
        mnemonic = "Stamp",
    )

def _stamp(ctx):
    stamp_files = []
    for key in ctx.attr.stamp_keys:
        file_name = 'STAMP_' + key
        stamp_file = ctx.actions.declare_file(file_name)
        stamp_files.append(stamp_file)
        _stamp_resolve(ctx, "{" + key + "}", stamp_file)

    return [
        DefaultInfo(
            files = depset(stamp_files),
            runfiles = ctx.runfiles(
                files = stamp_files,
            ),
        )
    ]

stamp = rule(
    implementation = _stamp,
    attrs = {
        "stamp_keys": attr.string_list(),
        "_stamper": attr.label(
            default = Label("//internal/stamp:stamper"),
            cfg = "host",
            executable = True,
            allow_files = True,
        ),
    }
)