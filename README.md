# CheckSuperCalls

Script that checks if Swift and Objective C subclasses call specific superclass methods.

Missing super calls in subclasses create unusual and hard to debug issues.
Having suffered in the past on a few projects, an automatic tool would help reduce above problems.
It checks by regex if a file overrides speciffic methods. Then it checks with another regex 
that it calls it's parent class counterpart.

Only the following are implemented:
- viewDidLoad
- viewWillAppear
- viewDidAppear
- viewWillDisappear
- viewDidDisappear
- viewWillLayoutSubviews
- viewDidLayoutSubviews
- init(nibName..)

Feel free to reach out with suggestions.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'check_super_calls'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install check_super_calls

## Usage

Run check-super-calls path/to/project/directory.



## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/check_super_calls.
