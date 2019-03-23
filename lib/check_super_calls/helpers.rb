require 'find'

# Convenience utilities.

def find_files(ignore_regex_string, base_path, extension)
  file_paths = []
  ignore_regex = Regexp.new(ignore_regex_string) unless ignore_regex_string.nil?
  Find.find(base_path) do |path|
    next if File.directory? path
    next if path !~ extension
    if ignore_regex
      next if path =~ ignore_regex
    end

    file_paths << path
  end
  file_paths
end

def check_line_overrides(_string)
  false
end

def check_line_calls_super(_string)
  false
end
