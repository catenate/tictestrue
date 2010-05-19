#!/usr/bin/ruby1.9.1 -w
require 'lib/board'

board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
board.display

printf("> ")
while move = gets
	board.move(Integer(move), "x")
	board.display
	printf("> ")
end
