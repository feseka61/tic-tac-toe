module Moves
  def play_x(board, place)
    row =
      case place[0]
      when 'a'
        0
      when 'b'
        1
      when 'c'
        2
      end
    column =
      case place[1]
      when '1'
        0
      when '2'
        1
      when '3'
        2
      end

    board[row][column] = 'x'
  end

  def play_o(board, place)
    row =
      case place[0]
      when 'a'
        0
      when 'b'
        1
      when 'c'
        2
      end
    column =
      case place[1]
      when '1'
        0
      when '2'
        1
      when '3'
        2
      end

    board[row][column] = 'o'
  end

  def check_rows(board)
    if board[0][0] == board[0][1] && board[0][0] == board[0][2] && board[0][0] != ' '
      true
    elsif board[1][0] == board[1][1] && board[1][0] == board[1][2] && board[1][0] != ' '
      true
    elsif board[2][0] == board[2][1] && board[2][0] == board[2][2] && board[2][0] != ' '
      true
    else
      false
    end
  end

  def check_columns(board)
    if board[0][0] == board[1][0] && board[0][0] == board[2][0] && board[0][0] != ' '
      true
    elsif board[0][1] == board[1][1] && board[0][1] == board[2][1] && board[0][1] != ' '
      true
    elsif board[0][2] == board[1][2] && board[0][2] == board[2][2] && board[0][2] != ' '
      true
    else
      false
    end
  end

  def check_cross(board)
    if board[0][0] == board[1][1] && board[0][0] == board[2][2] && board[0][0] != ' '
      true
    elsif board[2][0] == board[1][1] && board[1][1] == board[0][2] && board[2][0] != ' '
      true
    else
      false
    end
  end

  def finished?(board, current_player, tour)
    if check_columns(board) || check_rows(board) || check_cross(board)
      puts "#{current_player} won!"
      true
    elsif tour == 9
      puts "It's a draw!"
      true
    else
      false
    end
  end

  def show_board(board)
    puts '   1    2    3'
    puts '--------------'
    puts "a| #{board[0][0]} | #{board[0][1]} | #{board[0][2]}"
    puts '--------------'
    puts "b| #{board[1][0]} | #{board[1][1]} | #{board[1][2]}"
    puts '--------------'
    puts "c| #{board[2][0]} | #{board[2][1]} | #{board[2][2]}"
  end
end

class TicTacToe
  extend Moves

  def self.play
    tour = 1
    game_over = false
    turn = 'Player 1'
    board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
    show_board(board)
    until game_over
      puts '=============================================================================='
      puts "It's #{turn}'s turn'"
      puts 'Enter a place e.g: a0 ' # gecici, duzgun bir sey koy
      place = gets.chomp.to_s
      if turn == 'Player 1'
        play_x(board, place)
      else
        play_o(board, place)
      end
      show_board(board)
      game_over = tour >= 5 && finished?(board, turn, tour)
      turn = turn == 'Player 1' ? 'Player 2' : 'Player 1'
      tour += 1
    end
  end
end

TicTacToe.play
