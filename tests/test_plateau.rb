require "./lib/mars_rover.rb"
require "test/unit"

class PlateauTest < Test::Unit::TestCase
  def test_new_with_valid_coordinates_creates_a_new_plateau
    plateau = MarsRover::Plateau.new(5,5)
    assert_equal plateau.class, MarsRover::Plateau
  end
end