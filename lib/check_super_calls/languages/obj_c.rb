require_relative 'pattern.rb'

class ObjC
  attr_accessor :file_regex, :patterns
  def initialize
    @file_regex = regex_ending_with('(h|m)')
    @patterns = [
      Pattern.new(
        '[super viewDidLoad]',
        regex_any_spaces_between(
          ['-', '\(', 'void', '\)', 'viewDidLoad', '\{']
        ),
        regex_any_spaces_between(
          ['\[', 'super', 'viewDidLoad', '\]']
        )
      ),
      Pattern.new(
        '[super viewWillAppear:animated]',
        regex_any_spaces_between(
          ['-', '\(', 'void', '\)',
           'viewWillAppear:', '\(', 'BOOL', '\)', 'animated', '\{']
        ),
        regex_any_spaces_between(
          ['\[', 'super', 'viewWillAppear:animated', '\]']
        )
      ),
      Pattern.new(
        '[super viewWillDisappear:animated]',
        regex_any_spaces_between(
          ['-', '\(', 'void', '\)',
           'viewWillDisappear:', '\(', 'BOOL', '\)', 'animated', '\{']
        ),
        regex_any_spaces_between(
          ['\[', 'super', 'viewWillDisappear:animated', '\]']
        )
      ),
      Pattern.new(
        '[super viewDidAppear:animated]',
        regex_any_spaces_between(
          ['-', '\(', 'void', '\)',
           'viewDidAppear:', '\(', 'BOOL', '\)', 'animated', '\{']
        ),
        regex_any_spaces_between(
          ['\[', 'super', 'viewDidAppear:animated', '\]']
        )
      ),
      Pattern.new(
        '[super viewDidDisappear:animated]',
        regex_any_spaces_between(
          ['-', '\(', 'void', '\)',
           'viewDidDisappear:', '\(', 'BOOL', '\)', 'animated', '\{']
        ),
        regex_any_spaces_between(
          ['\[', 'super', 'viewDidDisappear:animated', '\]']
        )
      ),
      Pattern.new(
        '[super viewWillLayoutSubviews]',
        regex_any_spaces_between(
          ['-', '\(', 'void', '\)', 'viewWillLayoutSubviews', '\{']
        ),
        regex_any_spaces_between(
          ['\[', 'super', 'viewWillLayoutSubviews', '\]']
        )
      ),
      Pattern.new(
        '[super viewDidLayoutSubviews]',
        regex_any_spaces_between(
          ['-', '\(', 'void', '\)', 'viewDidLayoutSubviews', '\{']
        ),
        regex_any_spaces_between(
          ['\[', 'super', 'viewDidLayoutSubviews', '\]']
        )
      ),
      Pattern.new(
        '[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];',
        regex_any_spaces_between(
          ['-', '\(', '(id|instancetype)', '\)',
           'initWithNibName:', '\(', 'NSString', '\*', '\)', 'nibNameOrNil',
           'bundle:', '\(', 'NSBundle', '\*', '\)', 'nibBundleOrNil', '\{']
        ),
        regex_any_spaces_between(
          ['\[', 'super', 'initWithNibName:', 'nibNameOrNil',
           'bundle:', 'nibBundleOrNil' '\]']
        )
      )
    ]
  end
  end
