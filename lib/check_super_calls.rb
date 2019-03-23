require 'check_super_calls/version'
require 'check_super_calls/arguments_parser.rb'
require 'check_super_calls/shell_adapter.rb'

module CheckSuperCalls
  class Error < StandardError; end
  # Your code goes here...
  def self.main(args)
    options = Parser.parse(args)

    shell = ShellAdapter.new
    result = shell.process_files(options.ignore_regex_string, options.input_directory)
    # nandrei puts result
  end
end
