module MarsRover
  class Plateau
    attr_reader :x_max, :y_max

    def initialize(x_max, y_max)
      @x_min = 0
      @y_min = 0
      @x_max = x_max
      @y_max = y_max
    end
  end
end