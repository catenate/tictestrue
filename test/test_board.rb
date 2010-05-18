require 'test/unit'
require 'lib/board'

class TestTtt < Test::Unit::TestCase
	def setup
		@firstboard = [1, 2, 3, 4, 5, 6, 7, 8, 9]
		@board = Board.new(@firstboard)
	end
	
	def test_new
		assert_equal(@board.current_board, @firstboard)
	end
	
	def test_move_bad
		assert_raises(ArgumentError) { @board.apply_move("0", "x") }
		@board.apply_move(0, "x")
		assert_equal(@board.current_board, @firstboard)
		@board.apply_move(10, "x")
		assert_equal(@board.current_board, @firstboard)
	end

	def test_move_fill
		@board.apply_move(1, "x")
		assert_equal(@board.current_board, ["x", 2, 3, 4, 5, 6, 7, 8, 9])
		@board.apply_move(2, "x")
		assert_equal(@board.current_board, ["x", "x", 3, 4, 5, 6, 7, 8, 9])
		@board.apply_move(3, "x")
		assert_equal(@board.current_board, ["x", "x", "x", 4, 5, 6, 7, 8, 9])
		@board.apply_move(4, "x")
		assert_equal(@board.current_board, ["x", "x", "x", "x", 5, 6, 7, 8, 9])
		@board.apply_move(5, "x")
		assert_equal(@board.current_board, ["x", "x", "x", "x", "x", 6, 7, 8, 9])
		@board.apply_move(6, "x")
		assert_equal(@board.current_board, ["x", "x", "x", "x", "x", "x", 7, 8, 9])
		@board.apply_move(7, "x")
		assert_equal(@board.current_board, ["x", "x", "x", "x", "x", "x", "x", 8, 9])
		@board.apply_move(8, "x")
		assert_equal(@board.current_board, ["x", "x", "x", "x", "x", "x", "x", "x", 9])
		@board.apply_move(9, "x")
		assert_equal(@board.current_board, ["x", "x", "x", "x", "x", "x", "x", "x", "x"])
	end
end
