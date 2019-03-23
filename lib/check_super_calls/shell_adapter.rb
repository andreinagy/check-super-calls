require_relative 'helpers'
require_relative 'languages/swift.rb'
require_relative 'languages/obj_c.rb'

# Adapter which handles shell access.
class ShellAdapter
  def process_files(ignore_regex_string, base_path)
    [
      Swift.new,
      ObjC.new
    ].each do |language|
      files = find_files(ignore_regex_string, base_path, language.file_regex)

      files.each do |file|
        file_content = File.open(file, 'r:UTF-8').read

        language.patterns.each do |pattern|
          next if file_content !~ pattern.definition

          if file_content !~ pattern.check
            puts file + ': ' + pattern.name + ' not called'
            # nandrei add to array and return
          end
        end
      end
    end
  end
end
