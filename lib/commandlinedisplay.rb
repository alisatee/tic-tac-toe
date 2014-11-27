module Tictactoe
  class Commandline_display

    def render_game_welcome
      puts "Welcome to Tic Tac Toe!"
      puts "Flipping coin to see who gets to go first..."
    end

    def render_current_player(current_player)
      puts "Current player's turn: #{current_player}"
    end

    def render_game_board(board)
      board.game_board.each {|row| p row }
    end

    def prompt_for_turn
      puts "Please enter the coordinates of where you would like to go, \nseparated by a comma:"
      turn_coordinates = gets.chomp 
      if validate_input(turn_coordinates)
        turn_coordinates = turn_coordinates.split(",").map! {|coord| coord.to_i }
      end
    end

    def render_invalid_input_message
      puts "\nOoops! Invalid input. Try again.\n\n"
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

    def validate_input(input)
      input =~ /\w,\w/ 
    end
    
  end
end