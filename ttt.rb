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
end

board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
board.display_board
