require 'Pry'

module BoardPositions
  def self.positions
    hash = {}
    key = 1
    (1..5).each do |row|
      (1..5).each do |column|
        hash[key] = [row, column]
        key += 1
      end
    end
    hash
  end
end

class Board

  attr_reader :squares, :positions

  def initialize
    @squares = {}
    reset
    @positions = BoardPositions.positions
  end

  def unmarked_keys
    squares.keys.select { |key| squares[key].unmarked? }
  end

  def draw
    puts "    1   2   3   4   5  "
    puts "  +---+---+---+---+---|"
    puts "1 | #{squares[1]} | #{squares[2]} | #{squares[3]} | #{squares[4]} | #{squares[5]} |"
    puts "  +---+---+---+---+---|"
    puts "2 | #{squares[6]} | #{squares[7]} | #{squares[8]} | #{squares[9]} | #{squares[10]} |"
    puts "  +---+---+---+---+---|"
    puts "3 | #{squares[11]} | #{squares[12]} | #{squares[13]} | #{squares[14]} | #{squares[15]} |"
    puts "  +---+---+---+---+---|"
    puts "4 | #{squares[16]} | #{squares[17]} | #{squares[18]} | #{squares[19]} | #{squares[20]} |"
    puts "  +---+---+---+---+---|"
    puts "5 | #{squares[21]} | #{squares[22]} | #{squares[23]} | #{squares[24]} | #{squares[25]} |"
    puts "  +---+---+---+---+---|"
  end

  def reset
    (1..25).each { |key| squares[key] = Square.new }
  end

  def available?(chosen_square)
    return false if chosen_square.any? {|item| item < 1 || item > 5}
    key = positions.select {|k,v| v == chosen_square  }.keys.first
    squares[key].marker == Square::INITIAL_MARKER
  end

  def hit!(chosen_square)
    key = positions.select {|k,v| v == chosen_square  }.keys.first
    squares[key].marker = Square::HIT_MARKER
  end

  def miss!(chosen_square)
    key = positions.select {|k,v| v == chosen_square  }.keys.first
    squares[key].marker = Square::MISS_MARKER
  end

end

class Ship

  def initialize
    @hits = 0
    set_position
    @positions = BoardPositions.positions
    @alive = true
  end

  def status
    @alive ? 'Alive' : 'Sunk'
  end
  

  def hit?(square)
    key = @positions.select {|k,v| v == square  }.keys[0]
    set_position.include?(key)
  end

  def hit!
    @length -= 1
  end


  def destroyed?
    @length == 0
  end

  def destroy!
    @alive = false
  end

  def set_position
    # TODO, fixme
  end
end

class Destroyer < Ship

  def initialize
    super
    @length = 1
  end

  def status
    puts "Destroyer:\t" + super
  end

  def set_position
    [15]# TODO, fixme
  end

end

class Cruiser < Ship
  def initialize
    super
    @length = 2
  end

  def status
    puts "Cruiser:\t" + super
  end

  def set_position
    [1,2]
  end

end

class Battleship < Ship
  def initialize
    super
    @length = 3
  end

end

class Square
  INITIAL_MARKER = ' '
  HIT_MARKER = 'X'
  MISS_MARKER = '/'

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

end

class Player
  attr_reader :name, :board, :ships

  def initialize(name)
    @name = name
    @board = Board.new
    @ships = [Cruiser.new, Destroyer.new] 
  end

  def choose_square
    loop do
      puts "Please choose a square (such as 3,5) to open fire!"
      choice = gets.chomp
      choice = input_to_array(choice) 
      break choice if is_two_number_array?(choice) && board.available?(choice)
      puts "please enter a valid choice"
    end
  end

  def determine_hit_or_miss(square)
    ships.each do |ship|
      binding.pry
      if ship.hit?(square)
        ship.hit!
        board.hit!(square)
      else
        board.miss!(square)
      end
      ship.destroy! if ship.destroyed?
    end
  end

  private

  def input_to_array(user_input)
    user_input.split(",").map(&:to_i) 
  end

  def is_two_number_array?(user_input)
    user_input.all? {|n| n.is_a?(Fixnum)} && user_input.size == 2
  end

end

class Game
  attr_accessor :input, :output # I'm for testing
  attr_reader :board, :user

  def initialize
    self.input  = $stdin # I'm for testing
    self.output = $stdout # I'm for testing
  end

  def play
    @user = Player.new(get_player_name)
    play_game_loop
    #annouce_winner
  end

  def play_game_loop
    loop do
      display_user_board_and_ship_status
      user.determine_hit_or_miss(user.choose_square)
      display_user_board_and_ship_status
      break if user.ships.all? { |ship| ship.destroyed? } 
      
      # computer_turn
      # return if player_won?
    end
  end

  def get_player_name
    loop do
      output.puts "Welcome to Battle Ship. What is your name?"
      name = input.gets.chomp
      break name if name.size > 0
      puts "Enter a valid name."
    end
  end

  def display_owner_board
    puts "#{user.name.capitalize}'s Board:"
  end

  def display_user_board_and_ship_status
    system 'clear'
    puts "#{user.name.capitalize}'s Board:"
    user.board.draw
    user.ships.each {|ship| ship.status}
  end
end

battle = Game.new
battle.play


