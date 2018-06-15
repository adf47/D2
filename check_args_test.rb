require 'minitest/autorun'
require_relative 'check_args'

class CheckArgsTest < Minitest::Test

    # UNIT TESTS FOR METHOD check_args(args)
    # Equivalence classes:
    # args= [-INFINITY..-1,-INFINITY..-1] -> returns false
    # args= [1..INFINITY,1..INFINITY] -> returns true
    # args= (not a number) -> returns false
    # args= [0,0] -> returns false

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
    #EDGE CASE
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
    #EDGE CASE
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
