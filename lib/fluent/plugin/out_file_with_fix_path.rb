module Fluent
  class FileOutputWithFixPath < FileOutput
    Plugin.register_output('file_with_fix_path', self)
    # override super class method
    def generate_path(chunk)
      @path
    end
  end
end
