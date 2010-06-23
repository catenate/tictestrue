require 'board'

describe Board, "initializes" do
	it "returns from new an array with no moves" do
		board = Board.new
		board.board.should == [1, 2, 3, 4, 5, 6, 7, 8, 9]
	end

	it "returns from new an array with its empty initializer" do
		empty = [1, 2, 3, 4, 5, 6, 7, 8, 9]
		board = Board.new(empty)
		board.board.should == empty
	end

	it "returns from new an array with its move initializer" do
		move = ['o', 'x', 'o', 'x', 'x', 'o', 'x', 'o', 'x']
		board = Board.new(move)
		board.board.should == move
	end
end

describe Board, "rejects invalid move" do
	before(:each) do
		@board = Board.new
		@empty = @board.board
	end
	
	it "that is a string" do
		expect{ @board.move("0", "x") }.to raise_error(ArgumentError)
		@board.board.should == @empty
	end
	
	it "that underflows the array range" do
		@board.move(0, "x")
		@board.board.should == @empty
	end
	
	it "that overflows the array range" do
		@board.move(10, "x")
		@board.board.should == @empty
	end
end
