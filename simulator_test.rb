require 'minitest/autorun'
require_relative 'Simulator'

class SimulatorTest < Minitest::Test

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
