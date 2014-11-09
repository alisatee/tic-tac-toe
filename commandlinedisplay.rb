module Tictactoe

class Commandline_display

  def render_game_welcome
    puts "Welcome to Tic Tac Toe!"
    puts "Flipping coin to see who gets to go first..."
    sleep(3)
  end

  def render_current_player(current_player)
    puts "Current player's turn: #{current_player}"
  end

  def render_game_board
    puts "-------------"
    puts "|   |   |   |"
    puts "-------------"
    puts "|   |   |   |"
    puts "-------------"
    puts "|   |   |   |"
    puts "-------------"
  end

  def update_board_view(coordinates)
    puts "-------------"
    puts "|   |   |   |"
    puts "-------------"
    puts "|   |   |   |"
    puts "-------------"
    puts "|   |   |   |"
    puts "-------------"

  end

end



end