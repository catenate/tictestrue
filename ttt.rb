#!/usr/bin/ruby1.9.1 -w
require 'lib/board'

player = "x"
computer = "o"

puts "GREETINGS CRAFTSMAN #{ENV['USER'].upcase}"
board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
board.display

printf("> ")
while (!board.full) && (board.eval(player) < 120) && (board.eval(computer) < 120) && (move = gets)
	if move != "\n"
		board.move(Integer(move), player)
		board.move(board.pickxo(computer), computer)
		board.display
	else
		computer = player
		player = player == "x" ? "o" : "x"
		board.move(board.pickxo(computer), computer)
		board.display
	end
	printf("> ")
end

if board.eval(player) < 120 && board.eval(computer) < 120
	puts "THE ONLY WINNING MOVE IS NOT TO PLAY (tie)"
else
	if board.eval(computer) > board.eval(player)
		puts "HOW ABOUT A NICE GAME OF CHESS? (computer wins)"
	else
		puts "A STRANGE GAME (computer loses)"
	end
end
