class Board
	attr_accessor :board
	
	def initialize(board)
		@board = board
	end

	def display
		puts "#{@board[0]} #{@board[1]} #{@board[2]}"
		puts "#{@board[3]} #{@board[4]} #{@board[5]}"
		puts "#{@board[6]} #{@board[7]} #{@board[8]}"
	end

	def displayline
		puts "#{@board[0]} #{@board[1]} #{@board[2]} #{@board[3]} #{@board[4]} #{@board[5]} #{@board[6]} #{@board[7]} #{@board[8]}"
	end
	
	def eval(xo)
		score = 0
		
		# Each 3-in-a-row is worth 100.
		# horizontal
		if @board[0] == xo && @board[1] == xo && @board[2] == xo
			score += 100
		end
		if @board[3] == xo && @board[4] == xo && @board[5] == xo
			score += 100
		end
		if @board[6] == xo && @board[7] == xo && @board[8] == xo
			score += 100
		end
		
		# vertical
		if @board[0] == xo && @board[3] == xo && @board[6] == xo
			score += 100
		end
		if @board[1] == xo && @board[4] == xo && @board[7] == xo
			score += 100
		end
		if @board[2] == xo && @board[5] == xo && @board[8] == xo
			score += 100
		end
		
		# diagonal
		if @board[0] == xo && @board[4] == xo && @board[8] == xo
			score += 100
		end
		if @board[2] == xo && @board[4] == xo && @board[6] == xo
			score += 100
		end
		
		# Each 2-in-a-row is worth 10.
		# horizontal
		if @board[0] == xo && @board[1] == xo
			score += 10
		end
		if @board[1] == xo && @board[2] == xo
			score += 10
		end
		if @board[3] == xo && @board[4] == xo
			score += 10
		end
		if @board[4] == xo && @board[5] == xo
			score += 10
		end
		if @board[6] == xo && @board[7] == xo
			score += 10
		end
		if @board[7] == xo && @board[8] == xo
			score += 10
		end
		
		# vertical
		if @board[0] == xo && @board[3] == xo
			score += 10
		end
		if @board[1] == xo && @board[4] == xo
			score += 10
		end
		if @board[2] == xo && @board[5] == xo
			score += 10
		end
		if @board[3] == xo && @board[6] == xo
			score += 10
		end
		if @board[4] == xo && @board[7] == xo
			score += 10
		end
		if @board[5] == xo && @board[8] == xo
			score += 10
		end
		
		# diagonal
		if @board[0] == xo && @board[4] == xo
			score += 10
		end
		if @board[1] == xo && @board[3] == xo
			score += 10
		end
		if @board[1] == xo && @board[5] == xo
			score += 10
		end
		if @board[2] == xo && @board[4] == xo
			score += 10
		end
		if @board[3] == xo && @board[7] == xo
			score += 10
		end
		if @board[4] == xo && @board[6] == xo
			score += 10
		end
		if @board[4] == xo && @board[8] == xo
			score += 10
		end
		if @board[5] == xo && @board[7] == xo
			score += 10
		end
		
		# The center is worth 2, corners worth 1, to prevent forks.
		if @board[0] == xo
			score += 1
		end
		if @board[2] == xo
			score += 1
		end
		if @board[4] == xo
			score += 2
		end
		if @board[6] == xo
			score += 1
		end
		if @board[8] == xo
			score += 1
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
				-1
			end
		else
			puts "please enter 1-9"
			-1
		end
	end
	
	def pickx(xo)
		boards = Array.new(9) { Board.new([1, 2, 3, 4, 5, 6, 7, 8 ,9]) }
		
		evals = (0..8).map do |i|
			boards[i].move(i+1, xo)
			boards[i].eval(xo)
		end
		
		1 + (1..8).reduce(0) {|imax, i| evals[i] > evals[imax] ? i : imax }
	end
	
	def pickxo(xo)
		ox = xo == "x" ? "o" : "x"
		boards = Array.new(9) { Board.new(@board.dup) }
		
		evals = (0..8).map do |i|
			boards[i].move(i+1, xo)
			eval = boards[i].eval(xo)
			
			oboards = Array.new(9) { Board.new(boards[i].board.dup) }
			oevals = (0..8).map do |i|
				oboards[i].move(i+1, ox)
				oboards[i].eval(ox)
			end
			
			eval -= oevals.max
		end
		
		1 + (1..8).reduce(0) {|imax, i| evals[i] > evals[imax] ? i : imax }
	end
end
