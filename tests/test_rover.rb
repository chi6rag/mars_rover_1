require "./lib/mars_rover.rb"
require "test/unit"

class RoverTest < Test::Unit::TestCase

  def setup
    @plateau = MarsRover::Plateau.new(10, 10)
    @rover = MarsRover::Rover.new(4,5, "N", @plateau)
  end

  def cleanup
    @rover = nil
    @plateau = nil
  end

  def test_new_with_valid_position_and_heading_returns_a_rover
    assert_equal @rover.instance_eval("@x"), 4
    assert_equal @rover.instance_eval("@y"), 5
    assert_equal @rover.instance_eval("@heading"), "N"
  end

  def test_execute_with_left_instruction_turns_rover_left
    @rover.execute "L"
    assert_equal @rover.instance_eval("@heading"), "W"
  end

  def test_execute_with_right_instruction_turns_rover_right
    @rover.execute "R"
    assert_equal @rover.instance_eval("@heading"), "E"
  end

  def test_execute_with_move_instruction_moves_rover_in_direction_of_its_heading
    @rover.execute "M"
    assert_equal @rover.instance_eval("@x"), 4
    assert_equal @rover.instance_eval("@y"), 6
    assert_equal @rover.instance_eval("@heading"), "N"
  end

  def test_execute_with_test_input_set_one_moves_the_rover_appropriately
    @rover = MarsRover::Rover.new(1, 2, "N", @plateau)
    @rover.execute *("LMLMLMLMM".split(''))
    assert_equal @rover.instance_eval("@x"), 1
    assert_equal @rover.instance_eval("@y"), 3
    assert_equal @rover.instance_eval("@heading"), "N"
  end

  def test_execute_with_test_input_set_two_moves_the_rover_appropriately
    @rover = MarsRover::Rover.new(3, 3, "E", @plateau)
    @rover.execute *("MMRMMRMRRM".split(''))
    assert_equal @rover.instance_eval("@x"), 5
    assert_equal @rover.instance_eval("@y"), 1
    assert_equal @rover.instance_eval("@heading"), "E"
  end

  def test_execute_with_invalid_instructuons_raises_error
    @rover = MarsRover::Rover.new(10,10, "N", @plateau)
    assert_raise Exception do
      @rover.execute "X"
    end
  end

  def test_execute_to_move_rover_surpassing_plateau_coordinates_raises_error
  @rover = MarsRover::Rover.new(10,10, "N", @plateau)
    assert_raise Exception do
      @rover.execute "M"
    end
  end

  def test_coordinates_for_rover_returns_its_current_coordinates
    @rover = MarsRover::Rover.new(3, 3, "E", @plateau)
    assert_equal @rover.coordinates, [3, 3, "E"]
  end
end