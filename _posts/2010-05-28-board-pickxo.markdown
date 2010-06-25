---
layout: post
title: Board.pickxo
categories: explain
---
This post explains the function which selects the given<br>
player’s best next move on the board stored in the class.<br>

	70           def pickxo(xo)

The pickxo name is shorthand for select ("pick") a move by<br>
evaluating the boards resulting from each move by the<br>
player-represented-by-xo’s ("x"), also considering the<br>
player’s evaluation of the opponent's ("o") best response to<br>
each of those moves.  It’s terse because I didn't know how<br>
deep I’d need to make the lookahead, and wanted a compact<br>
notation in case I had to write pickxoxoxoxo.  I could have<br>
just used numbers, but xo is a specifies the player at each<br>
level of the lookahead.  This becomes more useful with more<br>
players and alternate orders of play.<br>

	71                   ox = xo == "x" ? "o" : "x"

Here we just figure ox to be the opponent.  I didn’t code the<br>
current player’s side ("x" or "o") in the Board class because<br>
I wanted to be able to use all its functions in a speculative<br>
manner, without considering the real current state of the<br>
game.  I think it would be straightforward to initialize each<br>
board with the current state of the player, but the functional<br>
programmer in me wanted to write a more general function which<br>
depended less on state.<br>

	72                   boards = Array.new(9) { Board.new(@board.dup) }

Figuring out that I needed dup here (and in line 78) was by<br>
far the most annoying part of this exercise.<br>
I originally strongly expected that the initializer would take<br>
care of cloning the parameter, by creating distinct instances<br>
of the object with which I initialized the class.<br>

Haskell creates new instances of objects with almost every<br>
operation you do, so you’re seldom working with reference<br>
semantics.  During development I actually created another<br>
class, Boards, which specifically had class-variable names<br>
like board1, board2, board3, … but abandoned and deleted it<br>
when its eval function and the eval function in Board ended up<br>
calling each other to go deeper in the position analysis.<br>

	73
	74                   evals = (0..8).map do |i|
	75                           boards[i].move(i+1, xo)
	76                           eval = boards[i].eval(xo)

The outer loop creates an array of integers.  Each integer is<br>
the value of the board (from the point of view of the player<br>
passed into the function) after that position is occupied<br>
(if possible) by the player’s move into that position.<br>
I found that I didn't need to do anything special to note that<br>
a move was illegal: returning the same array was enough,<br>
since every good move increases the evaluation of the board,<br>
by at least creating a pair or a valued position.<br>
This is also why the computer always tries to fill the center<br>
square and then a corner first: the center allows many<br>
interesting forks with corners, including the three-way fork<br>
of the center and two non-opposite corners.  (I wasn’t paying<br>
attention the first time it hit me with this.;)<br>

	77

But it’s not enough just to look at how good the player's<br>
position is, if as a result of that move you give the opposing<br>
player an instant win.  There’s a tradeoff here between the<br>
evaluation function and the depth of the lookahead.<br>
Since the board is so small, I was able to get away with a<br>
rather shallow lookahead by making the evaluation function<br>
more clever.<br>

Enhancing the evaluation function is also more efficient than<br>
looking ahead further.  More code in the evaluation function<br>
adds more constant time (O(n), where n is the number of moves<br>
to evaluate this turn) to the algorithms’ overall performance.<br>
Looking ahead further adds an exponential (O(n^m) on average,<br>
where m is the number of empty spaces on the board) to the<br>
growth rate.  With a small problem space like tic-tac-toe it<br>
is not such a problem to look ahead as deep as you want,<br>
but deep lookaheads in a game like Go are impractical because<br>
m is very large (for Go, n^m starts at 361^360).<br>
Chess adds wrinkles other than static board position,<br>
since each piece can move—differently—as well as be taken.<br>

	78                           oboards = Array.new(9) { Board.new(boards[i].board.dup) }

The ordinary indentation of imperative-loops-within-loops is a<br>
nice way to show visually that for each move we consider,<br>
we have to generate an entire array of boards to store each of<br>
the opponent’s responses.<br>

	79                           oevals = (0..8).map do |j|
	80                                   oboards[j].move(j+1, ox)
	81                                   oboards[j].eval(ox)
	82                           end

Here we create an array of integers which stores the<br>
evaluations (from the opposing player’s (ox) perspective)<br>
after each possible response to the player’s (xo) move.<br>

	83
	84                           eval -= oevals.max

We really only care about the opponent’s best move, so we take<br>
the maximum of the opposing player’s evaluations, and subtract<br>
it from the evaluation of only the player’s move.<br>
For example, there's no point in making a highly-rated<br>
open-fork position (where you have two ways to win, and both<br>
are not blocked), if you leave free the position the other<br>
player needs to immediately win.  Further, the numeric value<br>
of a winning position must be higher than the best possible<br>
board position without a win, so the evaluation function will<br>
always rate a win higher.<br>

	85                   end
	86
	87                   1 + (1..8).reduce(0) {|imax, i| evals[i] > evals[imax] ? i : imax }

This line figures out which move to recommend by returning the<br>
index corresponding to: the highest valuation after subtracting<br>
the value of the opposing player’s best response.<br>

	88           end
