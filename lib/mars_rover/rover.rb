module MarsRover
  class Rover
    def initialize(x, y, heading)
      @x = x
      @y = y
      @heading = heading
    end

    def execute *instructions
      instructions.each do |instruction|
        case instruction
        when "L"
          turn_left
        when "R"
          turn_right
        when "M"
          move
        end
      end
    end

    private
    def turn_left
      dir_index = ["N", "E", "S", "W"].find_index { |dir| dir == @heading }
      @heading = ["N", "E", "S", "W"][ (dir_index-1) % 4 ]
    end

    def turn_right
      dir_index = ["N", "E", "S", "W"].find_index { |dir| dir == @heading }
      @heading = ["N", "E", "S", "W"][ (dir_index+1) % 4 ]
    end

    def move
      case @heading
      when "N"
        @y+=1
      when "W"
        @x-=1
      when "S"
        @y-=1
      when "E"
        @x+=1
      else
      end
    end
  end
end