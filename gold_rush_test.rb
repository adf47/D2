#This tests the gold_rush.rb source code File
#This tests user input from command line, and valid argument testing

require 'minitest/autorun'
require_relative 'check_args'

class GoldRushTest < Minitest::Test

    #Test that no arguments on command line fails
    def test_check_args_invalid1
        args = CheckArgs.new
        assert_equal false, args.check_args([])
    end

    #Test that one argument on command line fails
    def test_check_args_invalid2
        args = CheckArgs.new
        assert_equal false, args.check_args([1])
    end

    #Test that string argument on command line fails
    def test_check_args_invalid_string
        args = CheckArgs.new
        assert_equal false, args.check_args(["HI"])
    end

    #Test that two string arguments on command line fails
    def test_check_args_invalid_string2
        args = CheckArgs.new
        assert_equal false, args.check_args(["HI", "HI2"])
    end

    #Test that negative int argument on command line fails
    def test_check_args_invalid_negative
        args = CheckArgs.new
        assert_equal false, args.check_args([-2,2])
    end

    #Test that zero fails argument on command line fails
    def test_check_args_invalid_zero
        args = CheckArgs.new
        assert_equal false, args.check_args([0,1])
    end

    #Test that valid arguments on command line pass
    def test_check_args_valid
        args = CheckArgs.new
        assert_equal true, args.check_args([1,2])
    end

end
