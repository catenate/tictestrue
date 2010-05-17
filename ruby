nb ruby 1.9.1 version option
/usr/bin/ruby1.9.1 -v
ruby 1.9.1p378 (2010-01-10 revision 26273) [x86_64-linux]


nb shebang ruby script shell command
#!/usr/bin/ruby1.9.1 -w


nb output string puts
puts "hello world"


nb ruby define print array element
board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
puts "#{board.inspect}"
puts "#{board[0]}"


nb function method structure layout
def /name/
	/code/
end


nb class initialize method structure layout
class Board
	def initialize(board)
		@board = board
	end
end


nb imput prompt loop exit nil
printf("> ")
while move = gets
	puts move
	printf("> ")
end
