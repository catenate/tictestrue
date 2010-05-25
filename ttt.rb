#!/usr/bin/ruby1.9.1 -w
require 'lib/board'

player = "x"
computer = "o"

puts "SHALL WE PLAY A GAME?"
board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
board.display(player)

printf("> ")
while (!board.full) && (board.eval(player) < MINWIN) && (board.eval(computer) < MINWIN) && (move = gets)
	if move != "\n"
		begin
			case board.move(Integer(move), player)
			when ERROR_FULL
				puts "position occupied"
			when ERROR_RANGE
				puts "please enter 1-9"
			else
				board.move(board.pickxo(computer), computer)
			end
		rescue ArgumentError
			puts "please enter 1-9"
		end
	else
		computer = player
		player = player == "x" ? "o" : "x"
		board.move(board.pickxo(computer), computer)
	end

	board.display(player)
	printf("> ")
end

case
when board.eval(player) < MINWIN && board.eval(computer) < MINWIN && board.full
	puts "HOW ABOUT A NICE GAME OF CHESS? (tie)"
when board.eval(computer) > MINWIN && board.eval(computer) > board.eval(player)
	puts "YOUR ONLY WINNING MOVE IS NOT TO PLAY (computer wins)"
when board.eval(player) > MINWIN && board.eval(player) > board.eval(computer)
	puts "A STRANGE GAME (computer loses)"
when !board.full
	puts "Because it's a boring game. It's always a tie."
else
	puts "what?"
end
