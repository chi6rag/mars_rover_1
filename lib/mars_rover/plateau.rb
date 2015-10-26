module MarsRover
  class Plateau
    attr_reader :x_max, :y_max

    def initialize(x_max, y_max)
      are_arguments_valid?(x_max, y_max)
      @x_min = 0
      @y_min = 0
      @x_max = x_max
      @y_max = y_max
    end

    private

    def are_arguments_valid?(x_max, y_max)
      return true if x_max > 0 && y_max > 0
      raise Exception.new "Invalid Plateau Coordinates"
    end

  end
end