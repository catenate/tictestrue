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
	
	it "and leaves board unchanged on underflow" do
		@board.move(0, "x")
		@board.board.should == @empty
	end
	
	it "and returns error on underflow" do
		@board.move(0, "x").should == ERROR_RANGE
	end
	
	it "and leaves board unchanged on overflow" do
		@board.move(10, "x")
		@board.board.should == @empty
	end
	
	it "and returns error on overflow" do
		@board.move(10, "x").should == ERROR_RANGE
	end
	
	it "to a filled square" do
		@board.move(1, "x")
		@board.board.should == ["x", 2, 3, 4, 5, 6, 7, 8, 9]
		@board.move(1, "o")
		@board.board.should == ["x", 2, 3, 4, 5, 6, 7, 8, 9]
	end
end

describe Board, "move" do
	before(:each) do
		@board = Board.new
		@empty = @board.board
	end
	
	it "fills in the board with a first move" do
		@board.move(1, "x")
		@board.board.should == ["x", 2, 3, 4, 5, 6, 7, 8, 9]
	end
end

describe Board, "eval first move" do
	before(:each) do
		@board = Board.new
		@empty = @board.board
	end
	
	it "sets value on corner 1" do
		@board.move(1, "x")
		@board.eval("x").should == CORNER
	end
	
	it "sets value on corner 3" do
		@board.move(3, "x")
		@board.eval("x").should == CORNER
	end
	
	it "sets value on corner 7" do
		@board.move(7, "x")
		@board.eval("x").should == CORNER
	end
	
	it "sets value on corner 9" do
		@board.move(9, "x")
		@board.eval("x").should == CORNER
	end
	
	it "sets value on side 2" do
		@board.move(2, "x")
		@board.eval("x").should == 0
	end
	
	it "sets value on side 4" do
		@board.move(4, "x")
		@board.eval("x").should == 0
	end
	
	it "sets value on side 6" do
		@board.move(6, "x")
		@board.eval("x").should == 0
	end
	
	it "sets value on side 8" do
		@board.move(8, "x")
		@board.eval("x").should == 0
	end
	
	it "sets value on center 5" do
		@board.move(5, "x")
		@board.eval("x").should == CENTER
	end
end

describe Board, "eval first two moves" do
	before(:each) do
		@board = Board.new
		@empty = @board.board
	end
	
	it "sets pair on corner 1 and side 2" do
		@board.move(1, "x")
		@board.move(2, "x")
		@board.eval("x").should == PAIR + CORNER
	end
	
	it "sets pair on corner 1 and center 5" do
		@board.move(1, "x")
		@board.move(5, "x")
		@board.eval("x").should == PAIR + CENTER + CORNER
	end
	
	it "sets pair on corner 1 and corner 9" do
		@board.move(1, "x")
		@board.move(9, "x")
		@board.eval("x").should == PAIR + 2*CORNER
	end
end

describe Board, "eval first three moves" do
	before(:each) do
		@board = Board.new
		@empty = @board.board
	end
	
	it "sets win on corners 1 and 3, and side 2" do
		@board.move(1, "x")
		@board.move(2, "x")
		@board.move(3, "x")
		@board.eval("x").should == WIN + 3*PAIR + 2*CORNER
	end
	
	it "sets win on corners 1 and 9, and center 5" do
		@board.move(1, "x")
		@board.move(5, "x")
		@board.move(9, "x")
		@board.eval("x").should == WIN + 3*PAIR + CENTER + 2*CORNER
	end
	
	it "sets win on sides 2 and 8, and center 5" do
		@board.move(1, "x")
		@board.move(2, "x")
		@board.move(3, "x")
		@board.eval("x").should == WIN + 3*PAIR + CENTER
	end
end

describe Board, "eval as fill board with x" do
	it "sets values after each move 1..9" do
		@board = Board.new
		@empty = @board.board
		@board.move(1, "x")
		@board.eval("x").should == CORNER
		@board.move(2, "x")
		@board.eval("x").should == PAIR + CORNER
		@board.move(2, "o")
		@board.eval("x").should == PAIR + CORNER
		@board.move(3, "x")
		@board.eval("x").should == WIN + 3*PAIR + 2*CORNER
		@board.move(4, "x")
		@board.eval("x").should == WIN + 4*PAIR + PAIR_BLOCKED + 2*CORNER
		@board.move(5, "x")
		@board.eval("x").should == WIN + 8*PAIR + PAIR_BLOCKED + 2*CORNER + CENTER
		@board.move(6, "x")
		@board.eval("x").should == 2*WIN + 11*PAIR + 2*PAIR_BLOCKED + 2*CORNER + CENTER
		@board.move(7, "x")
		@board.eval("x").should == 4*WIN + 15*PAIR + 2*PAIR_BLOCKED + 3*CORNER + CENTER
		@board.move(8, "x")
		@board.eval("x").should == 5*WIN + 18*PAIR + 4*PAIR_BLOCKED + 3*CORNER + CENTER
		@board.move(9, "x")
		@board.eval("x").should == 8*WIN + 24*PAIR + 4*PAIR_BLOCKED + 4*CORNER + CENTER
	end
end
