class Game
  attr_accessor :player1, :player2, :grid
  def initialize
    @grid = {
      "row1" => [" "," "," "],
      "row2" => [" "," "," "],
      "row3" => [" "," "," "]
      }
  end
  def show_grid
    puts "     |     |     "
    puts "   #{@grid["row1"][0]} |  #{@grid["row1"][1]}  |  #{@grid["row1"][2]}  "
    puts " ----|-----|-----"
    puts "   #{@grid["row2"][0]} |  #{@grid["row2"][1]}  |  #{@grid["row2"][2]}  "
    puts " ----|-----|-----"
    puts "   #{@grid["row3"][0]} |  #{@grid["row3"][1]}  |  #{@grid["row3"][2]}  "
    puts "     |     |     "
  end
  def add_players(player1, player2)
    @player1 = player1
    @player2 = player2
  end
  def start_game
    puts "Select a number:"
    puts "     |     |     "
    puts "   1 |  2  |  3  "
    puts " ----|-----|-----"
    puts "   4 |  5  |  6  "
    puts " ----|-----|-----"
    puts "   7 |  8  |  9  "
    puts "     |     |     "
    option = gets.chomp
  end
end

class Player
  attr_accessor :name, :mark
  def initialize
    puts "Insert the name of the player:"
    name = gets.chomp
    @name = name
    puts "Insert your mark:"
    mark = gets.chomp
    @mark = mark
  end
end

game = Game.new
p1 = Player.new
p p1.name
p p1.mark
game.show_grid
