module MarsRover
  class Rover
    def initialize(x, y, heading, plateau)
      @x = x
      @y = y
      @heading = heading
      @plateau = plateau
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
        else
          raise Exception.new "Inappropriate Instruction"
        end
      end
    end

    def coordinates
      [@x, @y, @heading]
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
        @y+=1 unless out_of_bounds? @x, @y+1
      when "W"
        @x-=1 unless out_of_bounds? @x-1, @y
      when "S"
        @y-=1 unless out_of_bounds? @x, @y-1
      when "E"
        @x+=1 unless out_of_bounds? @x+1, @y
      else
      end
    end

    def out_of_bounds?(x, y)
      raise Exception.new "Out Of Bounds" if ( x > @plateau.x_max ||
                                          x < 0 || y > @plateau.y_max || y < 0 )
      false
    end

  end
end