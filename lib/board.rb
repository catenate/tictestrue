X = "x"
O = "o"

CORNER = 1
CENTER = 2
PAIR = 10
PAIR_BLOCKED = 5
WIN = 100

MINWIN = 2*PAIR + WIN

ERROR_FULL = -1
ERROR_RANGE = -2

class Board
	attr_accessor :board
	
	def initialize(board = [1, 2, 3, 4, 5, 6, 7, 8, 9])
		@board = board
	end

	def display(xo)
		ox = xo == X ? O : X
		puts "#{@board[0]} #{@board[1]} #{@board[2]}	player #{xo}"
		puts "#{@board[3]} #{@board[4]} #{@board[5]}	computer #{ox}"
		puts "#{@board[6]} #{@board[7]} #{@board[8]}"
	end

	def eval(xo)
		score = 0
		
		# horizontal
		score += scorewin(xo, 0, 1, 2) + scorepair(xo, 0, 1, 2) + scorepair(xo, 1, 2, 0) + scorepair(xo, 2, 0, 1)
		score += scorewin(xo, 3, 4, 5) + scorepair(xo, 3, 4, 5) + scorepair(xo, 4, 5, 3) + scorepair(xo, 5, 3, 4)
		score += scorewin(xo, 6, 7, 8) + scorepair(xo, 6, 7, 8) + scorepair(xo, 7, 8, 6) + scorepair(xo, 8, 6, 7)
		
		# vertical
		score += scorewin(xo, 0, 3, 6) + scorepair(xo, 0, 3, 6) + scorepair(xo, 3, 6, 0) + scorepair(xo, 6, 0, 3)
		score += scorewin(xo, 1, 4, 7) + scorepair(xo, 1, 4, 7) + scorepair(xo, 4, 7, 1) + scorepair(xo, 7, 1, 4)
		score += scorewin(xo, 2, 5, 8) + scorepair(xo, 2, 5, 8) + scorepair(xo, 5, 8, 2) + scorepair(xo, 8, 2, 5)
		
		# diagonal
		score += scorewin(xo, 0, 4, 8) + scorepair(xo, 0, 4, 8) + scorepair(xo, 4, 8, 0) + scorepair(xo, 8, 0, 4)
		score += scorewin(xo, 2, 4, 6) + scorepair(xo, 2, 4, 6) + scorepair(xo, 4, 6, 2) + scorepair(xo, 6, 2, 4)
		score += scorepairblocked(xo, 1, 3) + scorepairblocked(xo, 1, 5) + scorepairblocked(xo, 3, 7) + scorepairblocked(xo, 5, 7)
			
		# center and corners
		if @board[4] == xo
			score += CENTER
		end
		score += scorecorner(xo, 0) + scorecorner(xo, 2) + scorecorner(xo, 6) + scorecorner(xo, 8)
					
		score
	end
	
	def full
		@board.all? {|b| b == X || b== O }
	end
	
	def move(move, xo)
		if move >= 1 && move <= 9
			if @board[move-1] != X && @board[move-1] != O
				@board[move-1] = xo
				move
			else
				ERROR_FULL
			end
		else
			ERROR_RANGE
		end
	end
	
	def pickxo(xo)
		ox = xo == X ? O : X
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
	
	def scorecorner(xo, corner)
		if @board[corner] == xo
			CORNER
		else
			0
		end
	end

	def scorepair(xo, pair1, pair2, block)
		ox = xo == X ? O : X
		if @board[pair1] == xo && @board[pair2] == xo
			(@board[block] == ox) ? PAIR_BLOCKED : PAIR
		else
			0
		end
	end

	def scorepairblocked(xo, pair1, pair2)
		if @board[pair1] == xo && @board[pair2] == xo
			PAIR_BLOCKED
		else
			0
		end
	end
		
	def scorewin(xo, triple1, triple2, triple3)
		if @board[triple1] == xo && @board[triple2] == xo && @board[triple3] == xo
			WIN
		else
			0
		end
	end
end
