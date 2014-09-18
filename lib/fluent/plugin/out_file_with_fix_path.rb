module Fluent
  class FileOutputWithFixPath < TimeSlicedOutput
    Plugin.register_output('file_with_fix_path', self)
    config_param :path, :string
    config_param :format, :string, :default => 'out_file'

    def initialize
      require 'time'
      super
    end

    def configure(conf)
      if path = conf['path']
        @path = path
      end
      unless @path
        raise ConfigError, "'path' parameter is required on file output"
      end
      conf['buffer_path'] ||= @path
      super

      conf['format'] = @format
      @formatter = TextFormatter.create(conf)

    end

    def format(tag, time, record)
      @formatter.format(tag, time, record)
    end

    def write(chunk)
      FileUtils.mkdir_p File.dirname(@path)
      File.open(@path, "a", DEFAULT_FILE_PERMISSION) do |f|
        chunk.write_to(f)
      end
    end

    def secondary_init(primary)
      # don't warn even if primary.class is not FileOutput
    end

  end
end
