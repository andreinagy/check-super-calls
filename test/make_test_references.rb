SCRIPT = './bin/check-super-calls'.freeze
REPO = 'test/fixtures/'.freeze

REFERENCE_DATA = [
  ['--- Test no arguments prints help',
   '',
   'test/test_references/help.txt'],
  ['--- Test Fixtures',
   'test/fixtures/',
   'test/test_references/fixtures.txt'],
  ['--- Test Ignore',
   'test/fixtures/ -i Ignore',
   'test/test_references/fixtures-ignore.txt'],
  ['--- Test Echo',
   'test/fixtures/ -e',
   'test/test_references/fixtures-echo.txt'],
  ['--- Test Totals',
   'test/fixtures/ -t -i Ignore',
   'test/test_references/fixtures-totals.txt'],
  ['--- Test All switches',
   'test/fixtures/ -e -t -i Ignore',
   'test/test_references/fixtures-all.txt']
].freeze

def generate_one_reference(args, file)
  `#{SCRIPT} #{args} > #{file}`
end

def make_test_references
  puts `pwd`
  REFERENCE_DATA.each do |item|
    generate_one_reference(item[1], item[2])
    puts "Generated file #{item[2]}"
  end
end

def diff_output_to_reference(args, file)
  string = `#{SCRIPT} #{args} | diff #{file} -`
  assert string.empty?
end

def test(title, args, reference_file)
  puts
  puts title
  diff_output_to_reference(args, reference_file)
end
