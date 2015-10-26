module MarsRover
  class Cli
    def start
      # plateauIo = PlateauIo.new
      
      # plateauIo.fetch_coordinates
      print "Enter the coordinates of the plateau separated by space: "
      coordinates = gets.chomp.split(/\s+/).map(&:to_i)
      plateau = MarsRover::Plateau.new(coordinates[0], coordinates[1])

      while true
        puts "\n1. Send Rover: "
        puts '2. Exit'
        print "Choose: "
        choice = gets.chomp.to_i

        case choice
        when 1
          print "Enter Rover's Position: "
          position = gets.chomp.split(/\s+/)
          rover = Rover.new(position[0].to_i, position[1].to_i, position[2], plateau)
          print "Enter Instruction for the Rover: "
          instructions = gets.chomp.split('')
          rover.execute *instructions
          print "Cooridnates: #{rover.coordinates}"
        when 2
          exit(0)
        end
      end
    end

  end
end