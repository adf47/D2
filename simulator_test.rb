require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require_relative 'simulator'

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



    # UNIT TESTS FOR METHOD run_simulation(prospector_count,pete) in Simulator Class
    # Equivalence classes:
    # prospector_count = -INFINITY..-1 -> returns nil
    # prospector_count = 1..INFINITY -> returns 1, snd tuns simulation as expected
    # going to 5 locations
    # prospector_count = (not a number) -> returns nil
    # prospector_count = 0 -> returns nil
    # pete = Object of type Prospector -> returns 1
    # pete = Object not of type Prospector -> returns nil

    #Test that negative value for prospector_count returns nil
    #EDGE CASE
    def test_run_simulation_negative
        sim = Simulator.new(1,2)
        mock_prospector = Minitest::Mock.new("Mock Prospector")
        def mock_prospector.mine;1;end
        def mock_prospector.next_location;1;end
        def mock_prospector.location_count;1;end
        assert_nil sim.run_simulation(-1,mock_prospector)
    end

    #Test that string value for prospector_count returns nil
    def test_run_simulation_string
        sim = Simulator.new(1,2)
        sim.set_map
        mock_prospector = Minitest::Mock.new("Mock Prospector")
        def mock_prospector.mine;1;end
        def mock_prospector.next_location;1;end
        def mock_prospector.location_count;1;end
        assert_nil sim.run_simulation("HI",mock_prospector)
    end

    #Test that a value of zero for prospector_count returns nil
    #EDGE CASE
    def test_run_simulation_zero
        sim = Simulator.new(1,2)
        sim.set_map
        mock_prospector = Minitest::Mock.new("Mock Prospector")
        def mock_prospector.mine;1;end
        def mock_prospector.next_location;1;end
        def mock_prospector.location_count;1;end
        assert_nil sim.run_simulation(0,mock_prospector)
    end

    #Tests that non-negative int value for prospector_count returns a 5. Then
    #continues normal behavior and runs the simulation as expected.
    #The 5 represents a successful reach of 5 locations
    def test_run_simulation_passes
        sim = Simulator.new(1,2)
        sim.set_map
        mock_prospector = Minitest::Mock.new("Mock Prospector")
        def mock_prospector.mine;1;end
        def mock_prospector.next_location;1;end
        def mock_prospector.location_count;1;end
        assert_equal 5, sim.run_simulation(4,mock_prospector)
    end

end
