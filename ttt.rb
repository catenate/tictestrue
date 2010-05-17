#!/usr/bin/ruby1.9.1 -w

class Board
	def initialize(board)
		@board = board
	end

	def display_board
		puts "#{@board[0]} #{@board[1]} #{@board[2]}"
		puts "#{@board[3]} #{@board[4]} #{@board[5]}"
		puts "#{@board[6]} #{@board[7]} #{@board[8]}"
	end
	
	def apply_move(move, xo)
		if move >= 1 && move <= 9
			@board[move-1] = xo
		else
			puts "please enter 1-9"
		end
	end
end

board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
board.display_board

printf("> ")
while move = gets
	board.apply_move(Integer(move), "x")
	board.display_board
	printf("> ")
end
