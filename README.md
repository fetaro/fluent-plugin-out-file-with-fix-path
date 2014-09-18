# Fluent::Plugin::FileOutputWithFixPath

This plugin is extention of fluentd out_file plugin.

This plugin has same functions to the default out_file plugin except that file path is fixed.

If you use out_file plugin, file path is `path + time_format + ".log"`.

But if you use this plugin, file path is just `path`.

Therefore `time_format` and `compress` option are not available.

## Installation

    $ gem install fluent-plugin-out-file-with-fix-path

## Sample

    <match td.test>
      type file_with_fix_path
      path /var/log/hoge.log
    </match>
