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
end

class Player
  attr_accessor :name, :mark
  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end

game = Game.new
game.show_grid
