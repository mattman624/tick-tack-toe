require './ttt'

board = Game::Board.new(3)
player_mark = "X"
x = 1
board.set_mark(x, 0, player_mark)
board.set_mark(x, 1, player_mark)
board.set_mark(x, 2, player_mark)
board.straight_line? == true


