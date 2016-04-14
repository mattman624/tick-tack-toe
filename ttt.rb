

class Game
  
  #@winner 

  #until game_over

  def initialize
    #@number_of_players
    @board = Board.new(3)
    start_game
  end

  def game_over?
    @board.straight_line?
  end 

  class Board 
    @side_size = 0
    #@squares = [][]
    def initialize(side_size)
      @side_size = side_size.to_i
      @squares = Array.new(@side_size) { Array.new(@side_size) {(" ") } }
    end

    def count_squares
      @side_size ** 2
    end

    def straight_line?
      comparisons = ( @side_size * 2 ) + 2
      straight_line = false
      i = 0
      #while index > comparisons
      while straight_line ==  false && i < comparisons  
        line = []
        #@index = i
        if  i == 0
          @side_size.times { |j| line << @squares[j][j] }
        elsif i - 1 == @side_size
          @side_size.times { |j| line << @squares[j][i - j] }

        elsif i -1 < @side_size
          @side_size.times { |j| line << @squares[i - 1][j] }
        else
          @side_size.times { |j| line << @squares[j][i - @side_size - 2] }          
        end

        if line.all? { |i| i == "O"}
          straight_line = true
        elsif line.all? { |i| i == "X" }
          straight_line = true
        end

        line = nil
        i += 1
      end 
      straight_line  
    end

    def set_mark(x, y, player_mark)
      @squares[x][y] = player_mark if @squares[x][y] == " "
    end

    def get_mark(x, y)
      @squares[x][y]
    end

    def show
      @side_size.times { |i| print "  #{i}"}
      puts "\n" + ( "=" * ( @side_size + 3 ) )
      @side_size.times { |i| puts ("#{i} " + @squares[i].join("|"))}
    end

  end 

  def start_game
    game_over = false
    print "Player 1 name: "
    name = gets.chomp
    player_1 = Player.new(name, "X")
    print "Player 2 name: "
    name = gets.chomp
    player_2 = Player.new(name, "O")
    current_player = player_2

    until game_over
      current_player == player_2 ? current_player = player_1 : current_player = player_2
      @board.show
      puts "#{current_player.name}'s turn, where will you place your mark? (x, y)"
      player_input = gets.chomp.split(", ")
      @board.set_mark(player_input[0].to_i, player_input[1].to_i, current_player.player_mark)
      game_over = game_over?
    end

    puts "#{current_player.name} won!"
    @board.show
  end

  class Player
    attr_accessor :name, :player_mark

    def initialize(name, player_mark)
      @name = name
      @player_mark = player_mark
    end

  end


  
end

game = Game.new

