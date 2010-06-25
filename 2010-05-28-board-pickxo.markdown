---
layout: post
title: Board.pickxo
categories: explain
---
This post explains the function which selects the given  
player’s best next move on the board stored in the class.  

	70           def pickxo(xo)

The pickxo name is shorthand for select ("pick") a move by  
evaluating the boards resulting from each move by the  
player-represented-by-xo’s ("x"), also considering the  
player’s evaluation of the opponent's ("o") best response to  
each of those moves.  It’s terse because I didn't know how  
deep I’d need to make the lookahead, and wanted a compact  
notation in case I had to write pickxoxoxoxo.  I could have  
just used numbers, but xo is a specifies the player at each  
level of the lookahead.  This becomes more useful with more  
players and alternate orders of play.  

	71                   ox = xo == "x" ? "o" : "x"

Here we just figure ox to be the opponent.  I didn’t code the  
current player’s side ("x" or "o") in the Board class because  
I wanted to be able to use all its functions in a speculative  
manner, without considering the real current state of the  
game.  I think it would be straightforward to initialize each  
board with the current state of the player, but the functional  
programmer in me wanted to write a more general function which  
depended less on state.  

	72                   boards = Array.new(9) { Board.new(@board.dup) }

Figuring out that I needed dup here (and in line 78) was by  
far the most annoying part of this exercise.  
I originally strongly expected that the initializer would take  
care of cloning the parameter, by creating distinct instances  
of the object with which I initialized the class.  

Haskell creates new instances of objects with almost every  
operation you do, so you’re seldom working with reference  
semantics.  During development I actually created another  
class, Boards, which specifically had class-variable names  
like board1, board2, board3, … but abandoned and deleted it  
when its eval function and the eval function in Board ended up  
calling each other to go deeper in the position analysis.  

	73
	74                   evals = (0..8).map do |i|
	75                           boards[i].move(i+1, xo)
	76                           eval = boards[i].eval(xo)

The outer loop creates an array of integers.  Each integer is  
the value of the board (from the point of view of the player  
passed into the function) after that position is occupied  
(if possible) by the player’s move into that position.  
I found that I didn't need to do anything special to note that  
a move was illegal: returning the same array was enough,  
since every good move increases the evaluation of the board,  
by at least creating a pair or a valued position.  
This is also why the computer always tries to fill the center  
square and then a corner first: the center allows many  
interesting forks with corners, including the three-way fork  
of the center and two non-opposite corners.  (I wasn’t paying  
attention the first time it hit me with this.;)  

	77

But it’s not enough just to look at how good the player's  
position is, if as a result of that move you give the opposing  
player an instant win.  There’s a tradeoff here between the  
evaluation function and the depth of the lookahead.  
Since the board is so small, I was able to get away with a  
rather shallow lookahead by making the evaluation function  
more clever.  

Enhancing the evaluation function is also more efficient than  
looking ahead further.  More code in the evaluation function  
adds more constant time (O(n), where n is the number of moves  
to evaluate this turn) to the algorithms’ overall performance.  
Looking ahead further adds an exponential (O(n^m) on average,  
where m is the number of empty spaces on the board) to the  
growth rate.  With a small problem space like tic-tac-toe it  
is not such a problem to look ahead as deep as you want,  
but deep lookaheads in a game like Go are impractical because  
m is very large (for Go, n^m starts at 361^360).  
Chess adds wrinkles other than static board position,  
since each piece can move—differently—as well as be taken.  

	78                           oboards = Array.new(9) { Board.new(boards[i].board.dup) }

The ordinary indentation of imperative-loops-within-loops is a  
nice way to show visually that for each move we consider,  
we have to generate an entire array of boards to store each of  
the opponent’s responses.  

	79                           oevals = (0..8).map do |j|
	80                                   oboards[j].move(j+1, ox)
	81                                   oboards[j].eval(ox)
	82                           end

Here we create an array of integers which stores the  
evaluations (from the opposing player’s (ox) perspective)  
after each possible response to the player’s (xo) move.  

	83
	84                           eval -= oevals.max

We really only care about the opponent’s best move, so we take  
the maximum of the opposing player’s evaluations, and subtract  
it from the evaluation of only the player’s move.  
For example, there's no point in making a highly-rated  
open-fork position (where you have two ways to win, and both  
are not blocked), if you leave free the position the other  
player needs to immediately win.  Further, the numeric value  
of a winning position must be higher than the best possible  
board position without a win, so the evaluation function will  
always rate a win higher.  

	85                   end
	86
	87                   1 + (1..8).reduce(0) {|imax, i| evals[i] > evals[imax] ? i : imax }

This line figures out which move to recommend by returning the  
index corresponding to: the highest valuation after subtracting  
the value of the opposing player’s best response.  

	88           end
