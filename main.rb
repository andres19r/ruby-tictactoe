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
    puts "Your mark is '#{p1.mark}'"
    p2 = Player.new
    p2.mark = 'O'
    puts "Your mark is '#{p2.mark}'"
    add_players(p1, p2)
    sw = 1
    until p1_winner? || p2_winner? || full_grid?
      if sw == 1
        p1.selection = choose(p1)
        paint_grid(p1, p1.selection)
        show_grid
        sw = 2
      elsif sw == 2
        p2.selection = choose(p2)
        paint_grid(p2, p2.selection)
        show_grid
        sw = 1
      end
    end
    if p1_winner?
      puts "Congrats #{p1.name}!!! You win!!!"
    elsif p2_winner?
      puts "Congrats #{p2.name}!!! You win!!!"
    elsif full_grid?
      puts "It's a draw "
    end
  end
  private
  def add_players(player1, player2)
    @player1 = player1
    @player2 = player2
  end
  def choose(player)
    puts "#{player.name} (#{player.mark}) select a number:"
    puts "     |     |     "
    puts "   1 |  2  |  3  "
    puts " ----|-----|-----"
    puts "   4 |  5  |  6  "
    puts " ----|-----|-----"
    puts "   7 |  8  |  9  "
    puts "     |     |     "
    sel = gets.chomp
    if check_cell?(sel)
      sel
    else
      puts "I'm sorry #{player.name}, you have to choose another number."
      show_grid
      choose(player)
    end
  end
  def check_cell?(sel)
    case sel
    when "1" then @grid["row1"][0] == " " ? true : false
    when "2" then @grid["row1"][1] == " " ? true : false
    when "3" then @grid["row1"][2] == " " ? true : false
    when "4" then @grid["row2"][0] == " " ? true : false
    when "5" then @grid["row2"][1] == " " ? true : false
    when "6" then @grid["row2"][2] == " " ? true : false
    when "7" then @grid["row3"][0] == " " ? true : false
    when "8" then @grid["row3"][1] == " " ? true : false
    when "9" then @grid["row3"][2] == " " ? true : false
    end
  end
  def paint_grid(player, place)
    case place
    when "1" then @grid["row1"][0] = player.mark
    when "2" then @grid["row1"][1] = player.mark
    when "3" then @grid["row1"][2] = player.mark
    when "4" then @grid["row2"][0] = player.mark
    when "5" then @grid["row2"][1] = player.mark
    when "6" then @grid["row2"][2] = player.mark
    when "7" then @grid["row3"][0] = player.mark
    when "8" then @grid["row3"][1] = player.mark
    when "9" then @grid["row3"][2] = player.mark
    end
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
  def full_grid?
   if @grid["row1"][0] != " " &&
      @grid["row1"][1] != " " &&
      @grid["row1"][2] != " " &&
      @grid["row2"][0] != " " &&
      @grid["row2"][1] != " " &&
      @grid["row2"][2] != " " &&
      @grid["row3"][0] != " " &&
      @grid["row3"][1] != " " &&
      @grid["row3"][1] != " "
     true
   else
     false
   end
  end
end

class Player
  attr_accessor :name, :mark, :selection
  def initialize
    puts "Insert the name of the player:"
    name = gets.chomp
    @name = name
    @mark = mark
  end
end

game = Game.new
game.start_game
