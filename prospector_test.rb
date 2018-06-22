require 'minitest/autorun'
require_relative 'prospector'
# Class that tests Prospector class
class ProspectorTest < Minitest::Test
  # UNIT TESTS FOR METHOD random_number(seed) in Prospector Class
  # Equivalence classes:
  # seed = -INFINITY..-1 -> returns nil
  # seed = 1..INFINITY -> returns pseudorandom number, that will always be the
  # same for the same seed
  # seed = (not a number) -> returns nil
  # seed = 0 -> returns nil

  # Test that negative numbers returns nil. This is also based on requirement 1
  # in that all seeds must be a non-negative positive integer.
  # EDGE CASE
  def test_random_number_negative
    seed = -1
    range = 7
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_nil pete.random_number(seed, range)
  end

  # Test that non-integer input returns nil. This is also based on requirement 1
  # in that all seeds must be a non-negative positive integer.
  # EDGE CASE
  def test_random_number_string
    seed = 'Hello!'
    range = 2
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_nil pete.random_number(seed, range)
  end

  # Test that zero returns nil. This is also based on requirement 1
  # in that all seeds must be a non-negative positive integer.
  # EDGE CASE
  def test_random_number_zero
    seed = 0
    range = 3
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_nil pete.random_number(seed, range)
  end

  # Test that nonnegative integer seed returns a random number.
  # This is also based on requirement 1
  # in that all seeds must be a non-negative positive integer.
  # should return the same random number when run multiple times with
  # The same seed.
  def test_random_number_passed
    seed = 1
    range = 8
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    first_run = pete.random_number(seed, range)
    assert_equal first_run, pete.random_number(seed, range)
  end

  # UNIT TESTS FOR METHOD location_count() in Prospector Class
  # Equivalence classes:
  # SHOLD ALWAYS RETURN 1. This method keeps a count of prospector
  # location visits. Will Always return 1 no matter what.

  # Test to confirm 1 is returned when called
  def test_location_count
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_equal 1, pete.location_count
  end

  # Test to confirm that 1 is returned everytime to achieve a count
  def test_location_count_repeat
    count = 0
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    80.times { count += pete.location_count }
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

  # Tests that negative itetation returns nil
  # EDGE CASE
  def test_negative_iteration_mine
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_nil pete.mine(-1, 1)
  end

  # Tests that 0 itetation returns 1
  # EDGE CASE
  def test_zero_iteration_mine
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_equal 1, pete.mine(0, 1)
  end

  # Tests that valid iteration input < 4 returns 1
  def test_iteration_mine_passes_less_than_four
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_equal 1, pete.mine(2, 1)
  end

  # Tests that valid input = 4 returns 1
  # EDGE CASE
  def test_iteration_mine_passes_equal_four
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_equal 1, pete.mine(4, 1)
  end

  # Tests that valid iteration input = 4 returns 1
  # EDGE CASE
  def test_iteration_mine_passes_greater_than_four
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_equal 1, pete.mine(5, 1)
  end

  # Tests that negative city value returns nil
  # EDGE CASE
  def test_negative_city_mine
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_nil pete.mine(1, -1)
  end

  # Tests that 0 city value returns 1
  # EDGE CASE
  def test_zero_city_mine
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_equal 1, pete.mine(1, 0)
  end

  # Tests that 7 city value returns nil
  # EDGE CASE
  def test_seven_city_mine
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_nil pete.mine(1, 7)
  end

  # Tests that valid city value returns 1
  def test_passes_city_mine
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_equal 1, pete.mine(1, 4)
  end

  # UNIT TESTS FOR METHOD mine(iteration,city) in Prospector Class
  # city = -INFINITY..-1 -> returns nil
  # city = 1..6 -> returns 1, and mining goes as expected
  # city = 0 -> returns 1, and mining goes as expected
  # city = 7..INFINITY -> returns nil

  # Tests negative input for city
  def test_mine_last_two_negative
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_nil pete.mine_last_two(-10)
  end

  # Tests invalid input == 7 for city
  # EDGE CASE
  def test_mine_last_two_invalid_input_seven
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_nil pete.mine_last_two(7)
  end

  # Tests invalid >= 7 input for city
  # EDGE CASE
  def test_mine_last_two_invalid_input
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_nil pete.mine_last_two(24)
  end

  # Tests zero input for city
  # EDGE CASE
  def test_mine_last_two_valid_zero
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_equal 1, pete.mine_last_two(0)
  end

  # Tests valid input for city
  def test_mine_last_two_valid_input
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_equal 1, pete.mine_last_two(4)
  end

  # UNIT TESTS FOR METHOD next_location(current_city,seed,prospector) in Prospector Class
  # Equivalence classes:
  # current_city = -INFINITY..-1 -> returns nil
  # current_city = 0..6 -> returns next city location
  # current_city = 7..INFINITY -> returns nil
  # seed = -INFINITY..-1 -> returns nil
  # seed = 1..INFINITY -> returns next city location
  # seed = 0 -> returns nil

  # Test negative input for current_city
  # EDGE CASE
  def test_next_location_negative_city
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    def mock_map_finder.get_city_index(_param)
      nil
    end
    assert_nil pete.next_location(-1, 1)
  end

  # Test invalid input = 7 for current_city
  # EDGE CASE
  def test_next_location_invalid_city_seven
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    def mock_map_finder.get_city_index(_param)
      nil
    end
    assert_nil pete.next_location(7, 1)
  end

  # Test invalid input > 7 for current_city
  def test_next_location_invalid_city
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    def mock_map_finder.get_city_index(_param)
      nil
    end
    assert_nil pete.next_location(10, 1)
  end

  # Test valid input for current_city
  def test_next_location_valid_city
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    def mock_map_finder.get_city_index(_param)
      3
    end
    assert_includes [0, 1, 2, 3, 4, 5, 6], pete.next_location(1, 1)
  end

  # Test negative input for seed
  # EDGE CASE
  def test_next_location_negative_seed
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    def mock_map_finder.get_city_index(_param)
      nil
    end
    assert_nil pete.next_location(1, -2)
  end

  # Test invalid input = 0 for seed
  # EDGE CASE
  def test_next_location_invalid_seed_zero
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    def mock_map_finder.get_city_index(_param)
      nil
    end
    assert_nil pete.next_location(1, 0)
  end

  # Test valid input for seed
  def test_next_location_valid_seed
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    def mock_map_finder.get_city_index(_param)
      3
    end
    assert_includes [0, 1, 2, 3, 4, 5, 6], pete.next_location(1, 2)
  end

  # UNIT TESTS FOR METHOD set_gold_chart in Prospector Class
  # Equivalence classes:
  # Should ALWAYS return 2D Array [[0,2],[0,3],[0,4],[0,5],[3,3],[5,0],[10,0]]

  def test_set_gold_chart
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_equal [[0, 2], [0, 3], [0, 4], [0, 5], [3, 3], [5, 0], [10, 0]], pete.set_gold_chart
  end

  # UNIT TESTS FOR METHOD calculate_money(silver,gold) in Prospector Class
  # Equivalence classes:
  # silver = -INFINITY..-1 -> returns nil
  # silver = 0..INFINITY -> returns valid total price rounded to
  # two decimal points.
  # silver = (Not a number)) -> returns nil
  # gold = -INFINITY..-1 -> returns nil
  # gold = 0..INFINITY -> returns valid total price rounded to
  # two decimal points.
  # gold = (Not a number)) -> returns nil

  # Test for when silver input is negative
  def test_negative_silver
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_nil pete.calculate_money(-2, 2)
  end

  # Test for when silver input is a string
  def test_string_silver
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_nil pete.calculate_money('Ounces', 2)
  end

  # Test for when silver input is valid
  def test_valid_silver
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_equal '43.96', pete.calculate_money(2, 2)
  end

  # Test for when silver input is valid and rounds to two decimals
  def test_valid_silver_two_decimals
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_equal '20.67', pete.calculate_money(15.77608, 0)
  end

  # Test for when gold input is negative
  def test_negative_gold
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_nil pete.calculate_money(2, -22)
  end

  # Test for when gold input is a string
  def test_string_gold
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_nil pete.calculate_money(6, 'Gold')
  end

  # Test for when gold input is valid
  def test_valid_gold
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_equal '449.79', pete.calculate_money(12, 21)
  end

  # Test for when gold input is valid and rounds to two decimals
  def test_valid_gold_two_decimals
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_equal '326.09', pete.calculate_money(0, 15.77608)
  end

  # UNIT TESTS FOR METHOD see_results(prospector) in Prospector Class
  # Equivalence classes:
  # prospector = -INFINITY..-1 -> returns nil
  # prospector = 0 -> returns nil
  # prospector = (Not a number)) -> returns nil
  # prospector = 0..INFINITY  -> returns results in form of string

  # Tests negative input for prospector
  def test_see_results_negative
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_nil pete.see_results(-4)
  end

  # Tests zero input for prospector
  # EDGE CASE
  def test_see_results_zero
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_nil pete.see_results(0)
  end

  # Tests string input for prospector
  def test_see_results_string
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_nil pete.see_results('Antonino')
  end

  # Tests valid input for prospector
  def test_see_results_valid
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    assert_equal 1, pete.see_results(2)
  end

  # Tests valid input for prospector formats output correctly
  def test_see_results_valid_output
    mock_map = Minitest::Mock.new('Mock Map')
    mock_map_finder = Minitest::Mock.new('Mock Map Finder')
    pete = Prospector.new(mock_map, mock_map_finder)
    out_put = "\n\nAfter 0 days prospector #4 returned to San Francisco with:\n"
    out_put += "      0 ounces of silver\n      0 ounces of gold\n      Heading home with $0.00\n\n\n"
    assert_output(out_put) { pete.see_results(4) }
  end
end
