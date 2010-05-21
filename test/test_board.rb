require 'test/unit'
require 'lib/board'

class TestTtt < Test::Unit::TestCase
	def setup
		@empty = [1, 2, 3, 4, 5, 6, 7, 8, 9]
		@board = Board.new(@empty)
	end
	
	def test_new
		assert_equal(@board.board, @empty)
	end
	
	def test_error
		assert_raises(ArgumentError) { @board.move("0", "x") }
		@board.move(0, "x")
		assert_equal(@board.board, @empty)
		@board.move(10, "x")
		assert_equal(@board.board, @empty)
	end

	def test_fill
		assert_equal(@board.eval("x"), 0)
		#assert_equal(@board.pick("x"), 5)
		
		@board.move(1, "x")
		assert_equal(@board.board, ["x", 2, 3, 4, 5, 6, 7, 8, 9])
		assert_equal(@board.eval("x"), 1)
		
		@board.move(2, "x")
		assert_equal(@board.board, ["x", "x", 3, 4, 5, 6, 7, 8, 9])
		assert_equal(@board.eval("x"), 11)
		
		@board.move(1, "o")
		assert_equal(@board.board, ["x", "x", 3, 4, 5, 6, 7, 8, 9])
		assert_equal(@board.eval("x"), 11)
		
		@board.move(3, "x")
		assert_equal(@board.board, ["x", "x", "x", 4, 5, 6, 7, 8, 9])
		assert_equal(@board.eval("x"), 132)
		
		@board.move(4, "x")
		assert_equal(@board.board, ["x", "x", "x", "x", 5, 6, 7, 8, 9])
		assert_equal(@board.eval("x"), 152)
		
		@board.move(5, "x")
		assert_equal(@board.board, ["x", "x", "x", "x", "x", 6, 7, 8, 9])
		assert_equal(@board.eval("x"), 194)
		
		@board.move(6, "x")
		assert_equal(@board.board, ["x", "x", "x", "x", "x", "x", 7, 8, 9])
		assert_equal(@board.eval("x"), 324)
		
		@board.move(7, "x")
		assert_equal(@board.board, ["x", "x", "x", "x", "x", "x", "x", 8, 9])
		assert_equal(@board.eval("x"), 555)
		
		@board.move(8, "x")
		assert_equal(@board.board, ["x", "x", "x", "x", "x", "x", "x", "x", 9])
		assert_equal(@board.eval("x"), 695)
		
		@board.move(9, "x")
		assert_equal(@board.board, ["x", "x", "x", "x", "x", "x", "x", "x", "x"])
		assert_equal(@board.eval("x"), 1046)
	end

	def test_first_1
		@board.move(1, "o")
		assert_equal(@board.eval("o"), 1)
	end

	def test_first_2
		@board.move(2, "o")
		assert_equal(@board.eval("o"), 0)
	end

	def test_first_3
		@board.move(3, "o")
		assert_equal(@board.eval("o"), 1)
	end

	def test_first_4
		@board.move(4, "o")
		assert_equal(@board.eval("o"), 0)
	end

	def test_first_5
		@board.move(5, "o")
		assert_equal(@board.eval("o"), 2)
	end

	def test_first_6
		@board.move(6, "o")
		assert_equal(@board.eval("o"), 0)
	end

	def test_first_7
		@board.move(7, "o")
		assert_equal(@board.eval("o"), 1)
	end

	def test_first_8
		@board.move(8, "o")
		assert_equal(@board.eval("o"), 0)
	end

	def test_first_9
		@board.move(9, "o")
		assert_equal(@board.eval("o"), 1)
	end
	
	def test_pickx
		pick = @board.pickx("x")
		assert_equal(pick, 5)
	end
	
	def test_pickxo
		pickaxe = @board.pickxo("x")
		assert_equal(pickaxe, 5)
		@board.move(pickaxe, "x")
		@board.display
		
		pickaxe = @board.pickxo("o")
		assert_equal(pickaxe, 1)		
		@board.move(pickaxe, "o")
		@board.display

		pickaxe = @board.pickxo("x")
		assert_equal(pickaxe, 3)
		@board.move(pickaxe, "x")
		@board.display
		
		pickaxe = @board.pickxo("o")
		assert_equal(pickaxe, 7)		
		@board.move(pickaxe, "o")
		@board.display

		pickaxe = @board.pickxo("x")
		assert_equal(pickaxe, 4)
		@board.move(pickaxe, "x")
		@board.display
		
		pickaxe = @board.pickxo("o")
		assert_equal(pickaxe, 6)		
		@board.move(pickaxe, "o")
		@board.display

		pickaxe = @board.pickxo("x")
		assert_equal(pickaxe, 2)
		@board.move(pickaxe, "x")
		@board.display
		
		pickaxe = @board.pickxo("o")
		assert_equal(pickaxe, 8)		
		@board.move(pickaxe, "o")
		@board.display

		pickaxe = @board.pickxo("x")
		assert_equal(pickaxe, 9)
		@board.move(pickaxe, "x")
		@board.display
	end
end
