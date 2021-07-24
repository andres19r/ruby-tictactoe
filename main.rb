class Game
  def initialize
    @grid = {
      "row1" => [" "," "," "],
      "row2" => [" "," "," "],
      "row3" => [" "," "," "]
      }
  end
  def start_game
    p1 = Player.new
    p1.mark = 'X'
    puts "Your mark is #{p1.mark}"
    p2 = Player.new
    p2.mark = 'O'
    puts "Your mark is #{p2.mark}"
    add_players(p1, p2)
  end
  private
  def add_players(player1, player2)
    @player1 = player1
    @player2 = player2
  end
  def choose(player)
    puts "Select a number:"
    puts "     |     |     "
    puts "   1 |  2  |  3  "
    puts " ----|-----|-----"
    puts "   4 |  5  |  6  "
    puts " ----|-----|-----"
    puts "   7 |  8  |  9  "
    puts "     |     |     "
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
  def p1_winner?
    if @grid["row1"][0] == "X" && @grid["row1"][1] == "X" && @grid["row1"][2] == "X"
      true
    elsif @grid["row2"][0] == "X" && @grid["row2"][1] == "X" && @grid["row2"][2] == "X"
      true
    elsif @grid["row3"][0] == "X" && @grid["row3"][1] == "X" && @grid["row3"][2] == "X"
      true
    elsif @grid["row1"][0] == "X" && @grid["row2"][0] == "X" && @grid["row3"][0] == "X"
      true
    elsif @grid["row1"][1] == "X" && @grid["row2"][1] == "X" && @grid["row3"][1] == "X"
      true
    elsif @grid["row1"][2] == "X" && @grid["row2"][2] == "X" && @grid["row3"][2] == "X"
      true
    elsif @grid["row1"][0] == "X" && @grid["row2"][1] == "X" && @grid["row3"][2] == "X"
      true
    elsif @grid["row1"][2] == "X" && @grid["row2"][1] == "X" && @grid["row3"][0] == "X"
      true
    else
      false
    end
  end
  def p2_winner?
    if @grid["row1"][0] == "O" && @grid["row1"][1] == "O" && @grid["row1"][2] == "O"
      true
    elsif @grid["row2"][0] == "O" && @grid["row2"][1] == "O" && @grid["row2"][2] == "O"
      true
    elsif @grid["row3"][0] == "O" && @grid["row3"][1] == "O" && @grid["row3"][2] == "O"
      true
    elsif @grid["row1"][0] == "O" && @grid["row2"][0] == "O" && @grid["row3"][0] == "O"
      true
    elsif @grid["row1"][1] == "O" && @grid["row2"][1] == "O" && @grid["row3"][1] == "O"
      true
    elsif @grid["row1"][2] == "O" && @grid["row2"][2] == "O" && @grid["row3"][2] == "O"
      true
    elsif @grid["row1"][0] == "O" && @grid["row2"][1] == "O" && @grid["row3"][2] == "O"
      true
    elsif @grid["row1"][2] == "O" && @grid["row2"][1] == "O" && @grid["row3"][0] == "O"
      true
    else
      false
    end
  end
end

class Player
  attr_accessor :name, :mark
  def initialize
    puts "Insert the name of the player:"
    name = gets.chomp
    @name = name
    @mark = mark
  end
end

game = Game.new
game.start_game
