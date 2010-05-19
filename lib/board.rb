class Board
	def initialize(board)
		@board = board
	end

	def get
		@board
	end

	def display
		puts "#{@board[0]} #{@board[1]} #{@board[2]}"
		puts "#{@board[3]} #{@board[4]} #{@board[5]}"
		puts "#{@board[6]} #{@board[7]} #{@board[8]}"
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
		
		# The center is worth 1.
		if @board[4] == xo
			score += 1
		end
		score
	end
	
	def move(move, xo)
		if move >= 1 && move <= 9
			@board[move-1] = xo
		else
			puts "please enter 1-9"
		end
	end
end
