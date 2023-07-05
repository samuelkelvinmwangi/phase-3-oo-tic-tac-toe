class TicTacToe
    attr_reader :board
  
    WIN_COMBINATIONS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
      [0, 4, 8], [6, 4, 2]              # diagonals
    ]
  
    def initialize
      @board = Array.new(9, " ")
    end
  
    def display_board
      puts " #{board[0]} | #{board[1]} | #{board[2]} "
      puts "-----------"
      puts " #{board[3]} | #{board[4]} | #{board[5]} "
      puts "-----------"
      puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end
  
    def input_to_index(input)
      input.to_i - 1
    end
  
    def move(index, player)
      board[index] = player
    end
  
    def position_taken?(index)
      board[index] != " "
    end
  
    def valid_move?(index)
      index.between?(0, 8) && !position_taken?(index)
    end
  
    def turn_count
      board.count { |position| position != " " }
    end
  
    def current_player
      turn_count.even? ? "X" : "O"
    end
  
    def turn
      puts "Please enter a number (1-9):"
      input = gets.chomp
      index = input_to_index(input)
  
      if valid_move?(index)
        player = current_player
        move(index, player)
        display_board
      else
        puts "Invalid move. Please try again."
        turn
      end
    end
  
    def won?
      WIN_COMBINATIONS.detect do |combo|
        position_taken?(combo[0]) &&
          board[combo[0]] == board[combo[1]] &&
          board[combo[0]] == board[combo[2]]
      end
    end
  
    def full?
      board.all? { |position| position != " " }
    end
  
    def draw?
      !won? && full?
    end
  
    def over?
      won? || draw?
    end
  
    def winner
      if combo = won?
        board[combo[0]]
      end
    end
  
    def play
      until over?
        turn
      end
  
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
    end
  end