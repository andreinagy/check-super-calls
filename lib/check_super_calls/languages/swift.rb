require_relative 'pattern.rb'

# consider
# https://github.com/realm/SwiftLint/blob/0.13.2/Source/SwiftLintFramework/Rules/RuleConfigurations/OverridenSuperCallConfiguration.swift#L12
# consider prohibited super calls https://github.com/realm/SwiftLint/pull/971

class Swift
  attr_accessor :file_regex, :patterns
  def initialize
    @file_regex = regex_ending_with('swift')
    @patterns = [
      Pattern.new(
        'super.viewDidLoad()',
        regex_any_spaces_between(
          ['override', 'func', 'viewDidLoad', '\(', '\)', '\{']
        ),
        regex_any_spaces_between(
          ['override', 'func', 'viewDidLoad', '\(', '\)',
           '\{(.|s)*', 'super', '\.viewDidLoad', '\(', '\)']
        )
      ),
      Pattern.new(
        'super.viewWillAppear(animated)',
        regex_any_spaces_between(
          ['override', 'func', 'viewWillAppear\(_ animated: Bool\) \{']
        ),
        regex_any_spaces_between(
          ['override', 'func', 'viewWillAppear\(_ animated: Bool\) \{',
           'super', '.viewWillAppear\(animated\)']
        )
      ),
      Pattern.new(
        'super.viewWillDisappear(animated)',
        regex_any_spaces_between(
          ['override', 'func', 'viewWillDisappear\(_ animated: Bool\) \{']
        ),
        regex_any_spaces_between(
          ['override', 'func', 'viewWillDisappear\(_ animated: Bool\) \{',
           'super', '.viewWillDisappear\(animated\)']
        )
      ),
      Pattern.new(
        'super.viewDidAppear(animated)',
        regex_any_spaces_between(
          ['override', 'func', 'viewDidAppear\(_ animated: Bool\) \{']
        ),
        regex_any_spaces_between(
          ['override', 'func', 'viewDidAppear\(_ animated: Bool\) \{',
           'super', '.viewDidAppear\(animated\)']
        )
      ),
      Pattern.new(
        'super.viewDidDisappear(animated)',
        regex_any_spaces_between(
          ['override', 'func', 'viewDidDisappear\(_ animated: Bool\) \{']
        ),
        regex_any_spaces_between(
          ['override', 'func', 'viewDidDisappear\(_ animated: Bool\) \{',
           'super', '.viewDidDisappear\(animated\)']
        )
      ),

      Pattern.new(
        'super.viewWillLayoutSubviews()',
        regex_any_spaces_between(
          ['override', 'func', 'viewWillLayoutSubviews\(\) \{']
        ),
        regex_any_spaces_between(
          ['override', 'func', 'viewWillLayoutSubviews\(\) \{',
           'super', '.viewWillLayoutSubviews\(\)']
        )
      ),
      Pattern.new(
        'super.viewDidLayoutSubviews()',
        regex_any_spaces_between(
          ['override', 'func', 'viewDidLayoutSubviews\(\) \{']
        ),
        regex_any_spaces_between(
          ['override', 'func', 'viewDidLayoutSubviews\(\) \{',
           'super', '.viewDidLayoutSubviews\(\)']
        )
      ),

      Pattern.new(
        'super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)',
        regex_any_spaces_between(
          ['override', 'init\(nibName nibNameOrNil: String\?,' \
            ' bundle nibBundleOrNil: Bundle\?\) \{']
        ),
        regex_any_spaces_between(
          ['override', 'init', '\(nibName nibNameOrNil: String\?,' \
            ' bundle nibBundleOrNil: Bundle\?\) \{',
           'super', '.init\(nibName: nibNameOrNil, bundle: nibBundleOrNil\)']
        )
      )
    ]
  end
  end
