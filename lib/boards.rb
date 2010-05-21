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
		@board1.displayline
		@board2.displayline
		@board3.displayline
		@board4.displayline
		@board5.displayline
		@board6.displayline
		@board7.displayline
		@board8.displayline
		@board9.displayline
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
		scores.max
	end

	def get
		[ @board1.get, @board2.get, @board3.get, @board4.get, @board5.get, @board6.get, @board7.get, @board8.get, @board9.get ]
	end
	
	def move(xo)
		test1 = @board1.move(1, xo) == -1
		test1 = @board2.move(2, xo) == -1
		test1 = @board3.move(3, xo) == -1
		test1 = @board4.move(4, xo) == -1
		test1 = @board5.move(5, xo) == -1
		test1 = @board6.move(6, xo) == -1
		test1 = @board7.move(7, xo) == -1
		test1 = @board8.move(8, xo) == -1
		test1 = @board9.move(9, xo) == -1
		test1 && test2 && test3 && test4 && test5 && test6 && test7 && test8 && test9 ? -1 : 0
	end

	def pick(xo)
		scores = [ @board1.eval(xo), @board2.eval(xo), @board3.eval(xo), @board4.eval(xo), @board5.eval(xo), @board6.eval(xo), @board7.eval(xo), @board8.eval(xo), @board9.eval(xo) ]

		imax = 0
		0.upto(8) do |i|
			if scores[i] > scores[imax]
				imax = i
			end
		end
		imax+1
	end
end
