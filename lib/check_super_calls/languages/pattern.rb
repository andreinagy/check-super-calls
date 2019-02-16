
class Pattern
  attr_accessor :name, :definition, :check
  def initialize(name, definition, check)
    @name = name
    @definition = definition
    @check = check
  end
  end

def regex_ending_with(string)
  Regexp.new('\\.' + string + '$')
end

def regex_any_spaces_between(array)
  Regexp.new(array.join('\\s*'))
end
