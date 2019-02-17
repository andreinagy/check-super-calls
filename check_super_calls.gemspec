lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'check_super_calls/version'

Gem::Specification.new do |spec|
  spec.name          = 'check_super_calls'
  spec.version       = CheckSuperCalls::VERSION
  spec.authors       = ['Andrei Nagy']
  spec.email         = ['nagy.andrei@gmail.com']

  spec.summary       = 'Check calls to superclasses in iOS code.'
  spec.description   = 'Script that checks if Swift and Objective C subclasses call specific superclass methods.'
  spec.homepage      = 'https://github.com/andreinagy/check-super-calls'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'

    # spec.metadata['homepage_uri'] = spec.homepage
    # spec.metadata["source_code_uri"] = "Put your gem's public repo URL here."
    # spec.metadata["changelog_uri"] = "Put your gem's CHANGELOG.md URL here."
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # spec.files = Dir.chdir(File.expand_path(__dir__)) do
  #   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/})
  #   puts f
  # }
  # end

  # spec.files = Dir['lib/**/*']
  spec.files = Dir.glob("{bin,lib}/**/*")
  # spec.files = [
  #   'lib/check_super_calls.rb',
  #   'lib/check_super_calls/arguments_parser.rb',
  #   'lib/check_super_calls/helpers.rb',
  #   'lib/check_super_calls/languages',
  #   'lib/check_super_calls/languages/obj_c.rb',
  #   'lib/check_super_calls/languages/pattern.rb',
  #   'lib/check_super_calls/languages/swift.rb',
  #   'lib/check_super_calls/shell_adapter.rb',
  #   'lib/check_super_calls/version.rb',
  #   'bin/check-super-calls'
  # ]
  # puts spec.files

  spec.bindir        = 'bin'
  spec.executables   = 'check-super-calls'
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
end
