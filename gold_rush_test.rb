#This tests the gold_rush.rb source code File
#This tests user input from command line, and valid argument testing

require 'minitest/autorun'
require_relative 'check_args'

class GoldRushTest < Minitest::Test

    def test_check_args_invalid
        args = CheckArgs.new
        assert_equal false, args.check_args([])
    end

end
