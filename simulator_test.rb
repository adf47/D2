require 'minitest/autorun'
require_relative 'simulator'
# Class that tests simulator class
class SimulatorTest < Minitest::Test
  # UNIT TESTS FOR METHOD run_simulation(prospector_count,pete) in Simulator Class
  # Equivalence classes:
  # prospector_count = -INFINITY..-1 -> returns nil
  # prospector_count = 1..INFINITY -> returns 1, snd tuns simulation as expected
  # going to 5 locations
  # prospector_count = (not a number) -> returns nil
  # prospector_count = 0 -> returns nil
  # pete = Object of type Prospector -> returns 1
  # pete = Object not of type Prospector -> returns nil

  # Test that negative value for prospector_count returns nil
  # EDGE CASE
  def test_run_simulation_negative
    sim = Simulator.new(1, 2)
    sim.set_map
    mock_prospector = Minitest::Mock.new('Mock Prospector')
    def mock_prospector.mine(_param, _param2)
      1
    end

    def mock_prospector.next_location(_param, _param2)
      1
    end

    def mock_prospector.location_count
      1
    end
    assert_nil sim.run_simulation(-1, mock_prospector)
  end

  # Test that string value for prospector_count returns nil
  def test_run_simulation_string
    sim = Simulator.new(1, 2)
    sim.set_map
    mock_prospector = Minitest::Mock.new('Mock Prospector')
    def mock_prospector.mine(_param, _param2)
      1
    end

    def mock_prospector.next_location(_param, _param2, _param3)
      1
    end

    def mock_prospector.location_count
      1
    end
    assert_nil sim.run_simulation('HI', mock_prospector)
  end

  # Test that a value of zero for prospector_count returns nil
  # EDGE CASE
  def test_run_simulation_zero
    sim = Simulator.new(1, 2)
    sim.set_map
    mock_prospector = Minitest::Mock.new('Mock Prospector')
    def mock_prospector.mine(_param, _param2)
      1
    end

    def mock_prospector.next_location(_param, _param2, _param3)
      1
    end

    def mock_prospector.location_count
      1
    end
    assert_nil sim.run_simulation(0, mock_prospector)
  end

  # Tests that non-negative int value for prospector_count returns a 5. Then
  # continues normal behavior and runs the simulation as expected.
  # The 5 represents a successful reach of 5 locations
  def test_run_simulation_passes
    sim = Simulator.new(1, 2)
    sim.set_map
    mock_prospector = Minitest::Mock.new('Mock Prospector')
    def mock_prospector.mine(_param, _param2)
      1
    end

    def mock_prospector.next_location(_param, _param2)
      1
    end

    def mock_prospector.location_count
      1
    end
    assert_equal 5, sim.run_simulation(4, mock_prospector)
  end

  # UNIT TESTS FOR METHOD set_map() in Simulator Class
  # Equivalence classes:
  # Accepts no parameters, but it is expected to ALWAYS, return the 2D
  # Array displayed below.

  def test_set_map
    map = [
      ['Sutter Creek', 'Coloma', 'Angels Camp'],
      ['Coloma', 'Virginia City', 'Sutter Creek'],
      ['Angels Camp', 'Nevada City', 'Virginia City', 'Sutter Creek'],
      ['Nevada City', 'Angels Camp'],
      ['Virginia City', 'Angels Camp', 'Coloma', 'Midas', 'El Dorado Canyon'],
      ['Midas', 'Virginia City', 'El Dorado Canyon'],
      ['El Dorado Canyon', 'Virginia City', 'Midas']
    ]
    sim = Simulator.new(1, 2)
    assert_equal map, sim.set_map
  end
end
