#This tests the gold_rush.rb source code File
#This tests user input from command line, and valid argument testing

require 'minitest/autorun'
require_relative 'gold_rush'

class GoldRushTest < Minitest::Test

    def test_check_args_invalid
        mock_sim = Minitest::Mock.new("Mock Sim")
        mock_sim.expect :check_args, 1
        mock_sim.expect :show_usage_and_exit, 1
        #gold_rush.check_args()
        assert_equal mock_sim
    end

end
