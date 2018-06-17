require 'minitest/autorun'
require_relative 'map_finder'
# Class that tests MapFinder class
class MapFinderTest < Minitest::Test
  # UNIT TESTS FOR METHOD get_city_index(city) in MapFinder Class
  # Equivalence classes:
  # city = -INFINITY..-1 -> returns nil
  # city = 1..INFINITY -> returns nil
  # city = valid city name -> returns index of city in array (as integer)
  # city = invalid city name -> returns nil
  # city = 0 -> returns nil

  # Tests negative number input
  def test_negative_num_input_city_index
    finder = MapFinder.new
    assert_nil finder.get_city_index(-4)
  end

  # Tests positive number input
  def test_positive_num_input_city_index
    finder = MapFinder.new
    assert_nil finder.get_city_index(4)
  end

  # Tests number zero input
  def test_zero_num_input_city_index
    finder = MapFinder.new
    assert_nil finder.get_city_index(0)
  end

  # Tests invalid string input
  def test_invalid_string_input_city_index
    finder = MapFinder.new
    assert_nil finder.get_city_index('Antonino Town')
  end

  # Tests invalid string input
  def test_valid_string_input_city_index
    finder = MapFinder.new
    assert_equal 5, finder.get_city_index('Midas')
  end
end
