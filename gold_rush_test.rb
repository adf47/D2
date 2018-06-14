#This tests the gold_rush.rb source code File
#This tests user input from command line, and valid argument testing

require 'minitest/autorun'
require_relative 'check_args'
require_relative 'Simulator'

class GoldRushTest < Minitest::Test

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



    # UNIT TESTS FOR METHOD random_number(seed) in Simulator Class
    # Equivalence classes:
    # seed = -INFINITY..-1 -> returns nil
    # seed = 1..INFINITY -> returns pseudorandom number, that will always be the
    # same for the same seed
    # seed = (not a number) -> returns nil
    # seed = 0 -> returns nil


    #Test that negative numbers returns nil. This is also based on requirement 1
    #in that all seeds must be a non-negative positive integer.
    #EDGE CASE
    def test_random_number_negative
        seed = -1
        num_of_prospectors = 2
        sim = Simulator.new(seed,num_of_prospectors)
        assert_nil sim.random_number(seed)
    end

    #Test that non-integer input returns nil. This is also based on requirement 1
    #in that all seeds must be a non-negative positive integer.
    #EDGE CASE
    def test_random_number_string
        seed = "Hello!"
        num_of_prospectors = 2
        sim = Simulator.new(seed,num_of_prospectors)
        assert_nil sim.random_number(seed)
    end

    #Test that zero returns nil. This is also based on requirement 1
    #in that all seeds must be a non-negative positive integer.
    #EDGE CASE
    def test_random_number_zero
        seed = 0
        num_of_prospectors = 2
        sim = Simulator.new(seed,num_of_prospectors)
        assert_nil sim.random_number(seed)
    end

    #Test that nonnegative integer seed returns a random number.
    #This is also based on requirement 1
    #in that all seeds must be a non-negative positive integer.
    #should return the same random number when run multiple times with
    #the same seed.
    def test_random_number_passed
        seed = 1
        num_of_prospectors = 2
        sim = Simulator.new(seed,num_of_prospectors)
        first_run = sim.random_number(seed)
        assert_equal first_run, sim.random_number(seed)
    end

end
