require "./lib/mars_rover.rb"
require "test/unit"

class RoverTest < Test::Unit::TestCase
  def test_new_with_valid_position_and_heading_returns_a_rover
    rover = MarsRover::Rover.new(4,5, "N")
    assert_equal rover.instance_eval("@x"), 4
    assert_equal rover.instance_eval("@y"), 5
    assert_equal rover.instance_eval("@heading"), "N"
  end

  def test_execute_with_no_instructions_keeps_rovers_coordinates_same
    rover = MarsRover::Rover.new(4,5, "N")
    rover.execute ""
    assert_equal rover.instance_eval("@x"), 4
    assert_equal rover.instance_eval("@y"), 5
    assert_equal rover.instance_eval("@heading"), "N"
  end

  def test_execute_with_left_instruction_turns_rover_left
    rover = MarsRover::Rover.new(4,5, "N")
    rover.execute "L"
    assert_equal rover.instance_eval("@heading"), "W"
  end

  def test_execute_with_right_instruction_turns_rover_right
    rover = MarsRover::Rover.new(4,5, "N")
    rover.execute "R"
    assert_equal rover.instance_eval("@heading"), "E"
  end

  def test_execute_with_move_instruction_moves_rover_in_direction_of_its_heading
    rover = MarsRover::Rover.new(4,5, "N")
    rover.execute "M"
    assert_equal rover.instance_eval("@x"), 4
    assert_equal rover.instance_eval("@y"), 6
    assert_equal rover.instance_eval("@heading"), "N"
  end

  def test_execute_with_test_input_set_one_moves_the_rover_appropriately
    rover = MarsRover::Rover.new(1, 2, "N")
    rover.execute *("LMLMLMLMM".split(''))
    assert_equal rover.instance_eval("@x"), 1
    assert_equal rover.instance_eval("@y"), 3
    assert_equal rover.instance_eval("@heading"), "N"
  end

  def test_execute_with_test_input_set_two_moves_the_rover_appropriately
    rover = MarsRover::Rover.new(3, 3, "E")
    rover.execute *("MMRMMRMRRM".split(''))
    assert_equal rover.instance_eval("@x"), 5
    assert_equal rover.instance_eval("@y"), 1
    assert_equal rover.instance_eval("@heading"), "E"
  end

  def test_coordinates_for_rover_returns_its_current_coordinates
    rover = MarsRover::Rover.new(3, 3, "E")
    assert_equal rover.coordinates, [3, 3, "E"]
  end
end