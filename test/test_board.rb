require 'test/unit'
require 'lib/board'
require 'lib/boards'

class TestTtt < Test::Unit::TestCase
	def setup
		@empty = [1, 2, 3, 4, 5, 6, 7, 8, 9]
		@board = Board.new(@empty)
	end
	
	def test_new
		assert_equal(@board.get, @empty)
	end
	
	def test_move_bad
		assert_raises(ArgumentError) { @board.move("0", "x") }
		@board.move(0, "x")
		assert_equal(@board.get, @empty)
		@board.move(10, "x")
		assert_equal(@board.get, @empty)
	end

	def test_move_fill
		assert_equal(@board.eval("x"), 0)
		
		@board.move(1, "x")
		assert_equal(@board.get, ["x", 2, 3, 4, 5, 6, 7, 8, 9])
		assert_equal(@board.eval("x"), 0)
		
		@board.move(2, "x")
		assert_equal(@board.get, ["x", "x", 3, 4, 5, 6, 7, 8, 9])
		assert_equal(@board.eval("x"), 10)
		
		@board.move(3, "x")
		assert_equal(@board.get, ["x", "x", "x", 4, 5, 6, 7, 8, 9])
		assert_equal(@board.eval("x"), 120)
		
		@board.move(4, "x")
		assert_equal(@board.get, ["x", "x", "x", "x", 5, 6, 7, 8, 9])
		assert_equal(@board.eval("x"), 140)
		
		@board.move(5, "x")
		assert_equal(@board.get, ["x", "x", "x", "x", "x", 6, 7, 8, 9])
		assert_equal(@board.eval("x"), 181)
		
		@board.move(6, "x")
		assert_equal(@board.get, ["x", "x", "x", "x", "x", "x", 7, 8, 9])
		assert_equal(@board.eval("x"), 311)
		
		@board.move(7, "x")
		assert_equal(@board.get, ["x", "x", "x", "x", "x", "x", "x", 8, 9])
		assert_equal(@board.eval("x"), 531)
		
		@board.move(8, "x")
		assert_equal(@board.get, ["x", "x", "x", "x", "x", "x", "x", "x", 9])
		assert_equal(@board.eval("x"), 671)
		
		@board.move(9, "x")
		assert_equal(@board.get, ["x", "x", "x", "x", "x", "x", "x", "x", "x"])
		assert_equal(@board.eval("x"), 1001)
	end

	def test_first_1
		@board.move(1, "o")
		assert_equal(@board.eval("o"), 0)
	end

	def test_first_2
		@board.move(2, "o")
		assert_equal(@board.eval("o"), 0)
	end

	def test_first_3
		@board.move(3, "o")
		assert_equal(@board.eval("o"), 0)
	end

	def test_first_4
		@board.move(4, "o")
		assert_equal(@board.eval("o"), 0)
	end

	def test_first_5
		@board.move(5, "o")
		assert_equal(@board.eval("o"), 1)
	end

	def test_first_6
		@board.move(6, "o")
		assert_equal(@board.eval("o"), 0)
	end

	def test_first_7
		@board.move(7, "o")
		assert_equal(@board.eval("o"), 0)
	end

	def test_first_8
		@board.move(8, "o")
		assert_equal(@board.eval("o"), 0)
	end

	def test_first_9
		@board.move(9, "o")
		assert_equal(@board.eval("o"), 0)
	end

	def test_eval_first
		boards = Boards.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
		boards.move("o")
		assert_equal(boards.eval("o"), 5)
	end
end
