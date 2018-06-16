require 'minitest/autorun'
require_relative 'prospector'

class ProspectorTest < Minitest::Test

    # UNIT TESTS FOR METHOD random_number(seed) in Prospector Class
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
        range = 7
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        assert_nil pete.random_number(seed,range)
    end

    #Test that non-integer input returns nil. This is also based on requirement 1
    #in that all seeds must be a non-negative positive integer.
    #EDGE CASE
    def test_random_number_string
        seed = "Hello!"
        range = 2
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        assert_nil pete.random_number(seed,range)
    end

    #Test that zero returns nil. This is also based on requirement 1
    #in that all seeds must be a non-negative positive integer.
    #EDGE CASE
    def test_random_number_zero
        seed = 0
        range = 3
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        assert_nil pete.random_number(seed,range)
    end

    #Test that nonnegative integer seed returns a random number.
    #This is also based on requirement 1
    #in that all seeds must be a non-negative positive integer.
    #should return the same random number when run multiple times with
    #the same seed.
    def test_random_number_passed
        seed = 1
        range = 8
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        first_run = pete.random_number(seed,range)
        assert_equal first_run, pete.random_number(seed,range)
    end



    # UNIT TESTS FOR METHOD location_count() in Prospector Class
    # Equivalence classes:
    # SHOLD ALWAYS RETURN 1. This method keeps a count of prospector
    # location visits. Will Always return 1 no matter what.

    #Test to confirm 1 is returned when called
    def test_location_count
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        assert_equal 1, pete.location_count()
    end

    #Test to confirm that 1 is returned everytime to achieve a count
    def test_location_count_repeat
        count = 0
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        80.times {count += pete.location_count}
        assert_equal 80, count
    end


    # UNIT TESTS FOR METHOD mine(iteration,city) in Prospector Class
    # Equivalence classes:
    # iteration = -INFINITY..-1 -> returns nil
    # iteration = 1..INFINITY -> returns 1, and mining goes as expected
    # iteration = 0 -> returns 1, and mining goes as expected
    # city = -INFINITY..-1 -> returns nil
    # city = 1..INFINITY -> returns 1, and mining goes as expected
    # city = 0 -> returns 1, and mining goes as expected

    #Tests that negative itetation returns nil
    #EDGE CASE
    def test_negative_iteration_mine
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        assert_nil pete.mine(-1,1,1)
    end

    #Tests that 0 itetation returns 1
    #EDGE CASE
    def test_zero_iteration_mine
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        assert_equal 1, pete.mine(0,1,1)
    end

    #Tests that valid iteration input < 4 returns 1
    def test_iteration_mine_passes_less_than_four
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        assert_equal 1, pete.mine(2,1,1)
    end

    #Tests that valid input = 4 returns 1
    #EDGE CASE
    def test_iteration_mine_passes_equal_four
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        assert_equal 1, pete.mine(4,1,1)
    end

    #Tests that valid iteration input = 4 returns 1
    #EDGE CASE
    def test_iteration_mine_passes_greater_than_four
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        assert_equal 1, pete.mine(5,1,1)
    end

    #Tests that negative city value returns nil
    #EDGE CASE
    def test_negative_city_mine
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        assert_nil pete.mine(1,-1,1)
    end

    #Tests that 0 city value returns 1
    #EDGE CASE
    def test_zero_city_mine
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        assert_equal 1, pete.mine(1,0,1)
    end

    #Tests that 7 city value returns nil
    #EDGE CASE
    def test_seven_city_mine
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        assert_nil pete.mine(1,7,1)
    end

    #Tests that valid city value returns 1
    def test_passes_city_mine
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        assert_equal 1, pete.mine(1,4,1)
    end

    # UNIT TESTS FOR METHOD next_location(current_city,seed,prospector) in Prospector Class
    # Equivalence classes:
    # current_city = -INFINITY..-1 -> returns nil
    # current_city = 0..6 -> returns next city location
    # current_city = 7..INFINITY -> returns nil
    # seed = -INFINITY..-1 -> returns nil
    # seed = 1..INFINITY -> returns next city location
    # seed = 0 -> returns nil
    # prospector = -INFINITY..-1 -> returns nil
    # prospector = 1..INFINITY -> returns next city location
    # prospector = 0 -> returns nil

    #Test negative input for current_city
    #EDGE CASE
    def test_next_location_negative_city
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        def mock_map_finder.get_city_index(param);nil;end
        assert_nil pete.next_location(-1,1,1)
    end

    #Test invalid input = 7 for current_city
    #EDGE CASE
    def test_next_location_invalid_city_seven
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        def mock_map_finder.get_city_index(param);nil;end
        assert_nil pete.next_location(7,1,1)
    end

    #Test invalid input > 7 for current_city
    def test_next_location_invalid_city
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        def mock_map_finder.get_city_index(param);nil;end
        assert_nil pete.next_location(10,1,1)
    end

    #Test valid input for current_city
    def test_next_location_valid_city
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        def mock_map_finder.get_city_index(param);3;end
        assert_includes [0,1,2,3,4,5,6], pete.next_location(1,1,1)
    end

    #Test negative input for seed
    #EDGE CASE
    def test_next_location_negative_seed
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        def mock_map_finder.get_city_index(param);nil;end
        assert_nil pete.next_location(1,-2,1)
    end

    #Test invalid input = 0 for seed
    #EDGE CASE
    def test_next_location_invalid_seed_zero
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        def mock_map_finder.get_city_index(param);nil;end
        assert_nil pete.next_location(1,0,1)
    end

    #Test valid input for seed
    def test_next_location_valid_seed
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        def mock_map_finder.get_city_index(param);3;end
        assert_includes [0,1,2,3,4,5,6], pete.next_location(1,2,1)
    end

    #Test negative input for prospector
    #EDGE CASE
    def test_next_location_negative_prospector
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        def mock_map_finder.get_city_index(param);nil;end
        assert_nil pete.next_location(1,2,-1)
    end

    #Test invalid input = 0 for prospector
    #EDGE CASE
    def test_next_location_invalid_seed_prospector
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        def mock_map_finder.get_city_index(param);nil;end
        assert_nil pete.next_location(1,1,0)
    end

    #Test valid input for prospector
    def test_next_location_valid_prospector
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        def mock_map_finder.get_city_index(param);3;end
        assert_includes [0,1,2,3,4,5,6], pete.next_location(1,2,1)
    end

    # UNIT TESTS FOR METHOD set_gold_chart in Prospector Class
    # Equivalence classes:
    # Should ALWAYS return 2D Array [[0,2],[0,3],[0,4],[0,5],[3,3],[5,0],[10,0]]

    def test_set_gold_chart
        mock_map = Minitest::Mock.new("Mock Map")
        mock_map_finder = Minitest::Mock.new("Mock Map Finder")
        pete = Prospector.new(mock_map,mock_map_finder)
        assert_equal [[0,2],[0,3],[0,4],[0,5],[3,3],[5,0],[10,0]],pete.set_gold_chart
    end


end
