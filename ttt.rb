#!/usr/bin/ruby1.9.1 -w
require 'lib/board'

board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
board.display_board

printf("> ")
while move = gets
	board.apply_move(Integer(move), "x")
	board.display_board
	printf("> ")
end
