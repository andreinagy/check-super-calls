require 'check_super_calls/version'
require 'check_super_calls/arguments_parser.rb'
require 'check_super_calls/shell_adapter.rb'

module CheckSuperCalls
  class Error < StandardError; end
  # Your code goes here...
  def self.main(_args)
    options = Parser.parse(ARGV)

    shell = ShellAdapter.new
    result = shell.process_files(nil, options.input_directory)
  end
end
