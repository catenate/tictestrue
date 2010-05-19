require 'lib/board'

class Boards
	def initialize(board)
		@board1 = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
		@board2 = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
		@board3 = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
		@board4 = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
		@board5 = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
		@board6 = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
		@board7 = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
		@board8 = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
		@board9 = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
	end

	def display
		@board1.display
		@board2.display
		@board3.display
		@board4.display
		@board5.display
		@board6.display
		@board7.display
		@board8.display
		@board9.display
	end

	def displayeval(xo)
		@board1.display
		puts @board1.eval(xo)
		@board2.display
		puts @board2.eval(xo)
		@board3.display
		puts @board3.eval(xo)
		@board4.display
		puts @board4.eval(xo)
		@board5.display
		puts @board5.eval(xo)
		@board6.display
		puts @board6.eval(xo)
		@board7.display
		puts @board7.eval(xo)
		@board8.display
		puts @board8.eval(xo)
		@board9.display
		puts @board9.eval(xo)
	end

	def eval(xo)
		scores = [ @board1.eval(xo), @board2.eval(xo), @board3.eval(xo), @board4.eval(xo), @board5.eval(xo), @board6.eval(xo), @board7.eval(xo), @board8.eval(xo), @board9.eval(xo) ]

		imax = 0
		0.upto(8) do |i|
			if scores[i] > scores[imax]
				imax = i
			end
		end
		imax+1
	end

	def get
		[ @board1.get, @board2.get, @board3.get, @board4.get, @board5.get, @board6.get, @board7.get, @board8.get, @board9.get ]
	end
	
	def move(xo)
		@board1.move(1, xo)
		@board2.move(2, xo)
		@board3.move(3, xo)
		@board4.move(4, xo)
		@board5.move(5, xo)
		@board6.move(6, xo)
		@board7.move(7, xo)
		@board8.move(8, xo)
		@board9.move(9, xo)
	end
end
