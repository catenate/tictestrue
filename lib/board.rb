CORNER = 1
CENTER = 2
PAIR = 10
WIN = 100

MINWIN = 2*PAIR + WIN

ERROR_FULL = -1
ERROR_RANGE = -2

class Board
	attr_accessor :board
	
	def initialize(board)
		@board = board
	end

	def display(xo)
		ox = xo == "x" ? "o" : "x"
		puts "#{@board[0]} #{@board[1]} #{@board[2]}	player #{xo}"
		puts "#{@board[3]} #{@board[4]} #{@board[5]}	computer #{ox}"
		puts "#{@board[6]} #{@board[7]} #{@board[8]}"
	end

	def eval(xo)
		score = 0
		
		# 3-in-a-row
		# horizontal
		if @board[0] == xo && @board[1] == xo && @board[2] == xo
			score += WIN
		end
		if @board[3] == xo && @board[4] == xo && @board[5] == xo
			score += WIN
		end
		if @board[6] == xo && @board[7] == xo && @board[8] == xo
			score += WIN
		end
		
		# vertical
		if @board[0] == xo && @board[3] == xo && @board[6] == xo
			score += WIN
		end
		if @board[1] == xo && @board[4] == xo && @board[7] == xo
			score += WIN
		end
		if @board[2] == xo && @board[5] == xo && @board[8] == xo
			score += WIN
		end
		
		# diagonal
		if @board[0] == xo && @board[4] == xo && @board[8] == xo
			score += WIN
		end
		if @board[2] == xo && @board[4] == xo && @board[6] == xo
			score += WIN
		end

		# 2-in-a-row
		# horizontal
		if @board[0] == xo && @board[1] == xo
			score += PAIR
		end
		if @board[1] == xo && @board[2] == xo
			score += PAIR
		end
		if @board[3] == xo && @board[4] == xo
			score += PAIR
		end
		if @board[4] == xo && @board[5] == xo
			score += PAIR
		end
		if @board[6] == xo && @board[7] == xo
			score += PAIR
		end
		if @board[7] == xo && @board[8] == xo
			score += PAIR
		end
		
		# vertical
		if @board[0] == xo && @board[3] == xo
			score += PAIR
		end
		if @board[1] == xo && @board[4] == xo
			score += PAIR
		end
		if @board[2] == xo && @board[5] == xo
			score += PAIR
		end
		if @board[3] == xo && @board[6] == xo
			score += PAIR
		end
		if @board[4] == xo && @board[7] == xo
			score += PAIR
		end
		if @board[5] == xo && @board[8] == xo
			score += PAIR
		end
		
		# diagonal
		if @board[0] == xo && @board[4] == xo
			score += PAIR
		end
		if @board[1] == xo && @board[3] == xo
			score += PAIR
		end
		if @board[1] == xo && @board[5] == xo
			score += PAIR
		end
		if @board[2] == xo && @board[4] == xo
			score += PAIR
		end
		if @board[3] == xo && @board[7] == xo
			score += PAIR
		end
		if @board[4] == xo && @board[6] == xo
			score += PAIR
		end
		if @board[4] == xo && @board[8] == xo
			score += PAIR
		end
		if @board[5] == xo && @board[7] == xo
			score += PAIR
		end
		
		# corners
		if @board[0] == xo && @board[2] == xo
			score += PAIR
		end
		if @board[0] == xo && @board[6] == xo
			score += PAIR
		end
		if @board[0] == xo && @board[8] == xo
			score += PAIR
		end
		if @board[2] == xo && @board[6] == xo
			score += PAIR
		end
		if @board[8] == xo && @board[2] == xo
			score += PAIR
		end
		if @board[8] == xo && @board[6] == xo
			score += PAIR
		end
		
		# edges
		if @board[1] == xo && @board[7] == xo
			score += PAIR
		end
		if @board[3] == xo && @board[5] == xo
			score += PAIR
		end
		
		# Value center and corners (better forks)
		if @board[0] == xo
			score += CORNER
		end
		if @board[2] == xo
			score += CORNER
		end
		if @board[4] == xo
			score += CENTER
		end
		if @board[6] == xo
			score += CORNER
		end
		if @board[8] == xo
			score += CORNER
		end
		
		score
	end
	
	def full
		@board.all? {|b| b == "x" || b== "o" }
	end
	
	def move(move, xo)
		if move >= 1 && move <= 9
			if @board[move-1] != "x" && @board[move-1] != "o"
				@board[move-1] = xo
				move-1
			else
				ERROR_FULL
			end
		else
			ERROR_RANGE
		end
	end
	
	def pickxo(xo)
		ox = xo == "x" ? "o" : "x"
		boards = Array.new(9) { Board.new(@board.dup) }
		
		evals = (0..8).map do |i|
			boards[i].move(i+1, xo)
			eval = boards[i].eval(xo)
			
			oboards = Array.new(9) { Board.new(boards[i].board.dup) }
			oevals = (0..8).map do |j|
				oboards[j].move(j+1, ox)
				oboards[j].eval(ox)
			end
			
			eval -= oevals.max
		end
		
		1 + (1..8).reduce(0) {|imax, i| evals[i] > evals[imax] ? i : imax }
	end
end
