# Fluent::Plugin::FileOutputWithFixPath

This is extention of out_file plugin.

This has same functions to the out_file plugin except that file path is fixed.
If you use out_file plugin, file path is `path + time_format + ".log"`,
but if you use this plugin, file path is just `path`.
Therefore `time_format` option is ignored.

## Installation

    $ gem install fluent-plugin-out-file-with-fix-path

## Sample

    <match td.test>
      type file_with_fix_path
      path /var/log/hoge.log
    </match>
