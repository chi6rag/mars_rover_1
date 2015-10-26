require "./lib/mars_rover.rb"
require "test/unit"

class RoverTest < Test::Unit::TestCase
  def test_new_with_valid_position_and_heading_returns_a_rover
    rover = MarsRover::Rover.new(4,5, "N")
    assert_equal rover.instance_eval("@x"), 4
    assert_equal rover.instance_eval("@y"), 5
    assert_equal rover.instance_eval("@heading"), "N"
  end
end