require "ttt"

describe "Game::square" do
  board = Game::Board.new(3)
  #it "takes coordinates and will return them" do
   # x = Square.new(1,2)
    #expect((x.x_coordinate == 1) && (x.y_coordinate == 2)).to eq(true)
  #end

  it 'can take an x or o' do
    player_mark = "O"
    board.set_mark(0,0,player_mark)
    expect(board.get_mark(0,0)).to eq("O")
  end

  it "does not allow marks to be rewritten" do
    player_mark = "O"
    board.set_mark(0,0,player_mark)
    board.set_mark(0,0,"X")
    expect(board.get_mark(0,0)).to eq("O")    
  end
end

describe 'Board' do
  board = Game::Board.new(3)
  it 'initializes with 9 squares' do
    
    expect(board.count_squares).to eq(9)
  end

  it "places x's and o's at specified coordinates" do
    player_mark = "X"
    x = 1
    y = 2
    board.set_mark(x, y, player_mark)
    expect(board.get_mark(x, y)).to eq("X")
  end

  it 'identifies when there is a horizontal straight line' do
    player_mark = "X"
    x = 0
    board.set_mark(x, 0, player_mark)
    board.set_mark(x, 1, player_mark)
    board.set_mark(x, 2, player_mark)
    expect(board.straight_line?).to eq(true)
  end

  new_board = Game::Board.new(3)
  it 'identifies diaginal lines' do
    player_mark = "O"
    x = 1
    new_board.set_mark(0, 0, player_mark)
    new_board.set_mark(1, 1, player_mark)
    new_board.set_mark(2, 2, player_mark)
    expect(new_board.straight_line?).to eq(true)
  end

  third_board = Game::Board.new(3)
  it 'identifies  vertical lines' do
    player_mark = "O"
    x = 1
    third_board.set_mark(0, x, player_mark)
    third_board.set_mark(1, x, player_mark)
    third_board.set_mark(2, x, player_mark)
    expect(third_board.straight_line?).to eq(true)
  end

  add_board = Game::Board.new(3)
  it 'identifies that there are no straight lines' do
    player_mark = "X"
    x = 1
    add_board.set_mark(x, 0, player_mark)
    expect(add_board.straight_line?).to eq(false)
  end

  describe 'Game' do
    it 'gets a number of players' do
      game = Game.new(2)

      
    end

  end
  
end
