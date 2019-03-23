require 'optparse'

# https://docs.ruby-lang.org/en/2.1.0/OptionParser.html
Options = Struct.new(:input_directory,
  :ignore_regex_string,
  :echo_invocation,
  :print_totals
  )

SCRIPT_NAME = "check-super-calls".freeze

# Parses command line arguments
class Parser
  def self.default_options
    result = Options.new
    result.input_directory = '.'
    result.echo_invocation = false
    result.print_totals = false
    result
  end
  private_class_method :default_options

  def self.parse(argv)
    # If no arguments supplied, print help
    argv << '-h' if argv.empty?

    result = default_options

    options_parser = OptionParser.new do |o|
      o.banner = 'Usage: {SCRIPT_NAME} [input directory]'
# nandrei add an ignore option.
      o.on('-h',
           '--help',
           'Prints this help') do
        puts options_parser
        exit 0
      end
      o.on('-iIGNORE',
        '--ignore-regex=IGNORE',
        'Case sensitive ignore files regex. Eg. "Ignore|Debug"') do |v|
     result.ignore_regex_string = v
   end

    o.on('-e',
      '--echo',
      'Echo invocation') do |_v|
   result.echo_invocation = true
 end

 o.on('-t',
   '--total',
  'Print total') do |_v|
result.print_totals = true
end
end

    begin
      options_parser.parse!(argv)
    rescue StandardError => exception
      puts exception
      puts options_parser
      exit 1
    end

    result.input_directory = argv.pop
    if result.input_directory.nil? || !Dir.exist?(result.input_directory)
      puts 'Can\'t find directory ' + result.input_directory
      Parser.parse %w[--help]
      exit 0
    end

    result
  end
end
