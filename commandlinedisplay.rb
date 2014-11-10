module Tictactoe

class Commandline_display

  def render_game_welcome
    puts "Welcome to Tic Tac Toe!"
    puts "Flipping coin to see who gets to go first..."
    # sleep(3)
  end

  def render_current_player(current_player)
    puts "Current player's turn: #{current_player}"
  end

  def render_game_board(board)
    board.game_board.each {|row| p row }
  end

  def prompt_for_turn(current_player) 
    render_current_player(current_player)
    puts "Please enter the coordinates of where you would like to go:"
    turn_coordinates = gets.chomp 
    turn_coordinates = turn_coordinates.split("").map! {|coord| coord.to_i }
  end

  def congratulate_winner(winner)
    puts "Congratulations, #{winner}, you won!"
  end

  def announce_draw
    puts "ITS A DRAW!"
  end

  def prompt_to_play_again
    puts "Do you want to play again? (Y/N)"
    answer = gets.chomp
  end

end



end