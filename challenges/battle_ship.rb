require 'Pry'

module BoardPositions
  def self.positions
    array = []
    index = 0
    (1..5).each do |row|
      (1..5).each do |column|
        array[index] = [row, column]
        index += 1
      end
    end
    array
  end
end

class Board

  attr_reader :squares, :size

  def initialize
    @size = 5
    @squares = []
    positions = BoardPositions.positions
    reset(positions)
  end

  def unmarked_keys
    squares.keys.select { |key| squares[key].unmarked? }
  end

  def draw
    puts "    1   2   3   4   5  "
    puts "  +---+---+---+---+---|"
    puts "1 | #{squares[0]} | #{squares[1]} | #{squares[2]} | #{squares[3]} | #{squares[4]} |"
    puts "  +---+---+---+---+---|"
    puts "2 | #{squares[5]} | #{squares[6]} | #{squares[7]} | #{squares[8]} | #{squares[9]} |"
    puts "  +---+---+---+---+---|"
    puts "3 | #{squares[10]} | #{squares[11]} | #{squares[12]} | #{squares[13]} | #{squares[14]} |"
    puts "  +---+---+---+---+---|"
    puts "4 | #{squares[15]} | #{squares[16]} | #{squares[17]} | #{squares[18]} | #{squares[19]} |"
    puts "  +---+---+---+---+---|"
    puts "5 | #{squares[20]} | #{squares[21]} | #{squares[22]} | #{squares[23]} | #{squares[24]} |"
    puts "  +---+---+---+---+---|"
  end

  def reset(positions)
    0.upto(24) { |index| squares[index] = Square.new(positions[index][0], positions[index][1]) }
  end

  def square_available?(chosen_square)
    selected = squares.select { |square| chosen_square == square.position}.first
    return false if selected.nil?
    selected.unmarked?
  end

  def hit!(chosen_position)
    squares.select {|square| square.position == chosen_position }.first.marker = Square::HIT_MARKER
  end

  def miss!(chosen_position)
    squares.select {|square| square.position == chosen_position }.first.marker = Square::MISS_MARKER
  end

  def location(position)
     squares.select { |square| square.position == position }.first
  end

end

class Square
  INITIAL_MARKER = ' '
  HIT_MARKER = 'X'
  MISS_MARKER = '/'

  attr_accessor :marker, :ship_placed
  attr_reader :row, :column

  def initialize(row, column, marker=INITIAL_MARKER)
    @row = row
    @column = column
    @marker = marker
    @ship_placed = false
  end

  def to_s
    marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def position
    [row, column]
  end
end

class Ship
  attr_accessor :ship_positions
  attr_reader :length

  def initialize
    @hits = 0
    @alive = true
    @ship_positions = []
  end

  def status
    @alive ? 'Alive' : 'Sunk'
  end
  

  def hit?(chosen_position)
    ship_positions.include?(chosen_position)
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

end

class Destroyer < Ship

  def initialize
    super
    @length = 1
  end

  def status
    puts "Destroyer:\t" + super
  end

  def set_position(board)
    place_ship(board)
    position = board.one_available_squares.sample.position
    board.location(position).ship_placed = true
    ship_positions << position
  end

  def place_ship(board)
    binding.pry
    num = rand(1..2)
    num == 1 ? 
    max_placement = board.size + 1 - length
    loop do

      # if horizontal
        # choose number 1..max, this is the column
        # choose number 1..5, this is the row
        # get the square from the numbers
        # add ship length to get next square(s)
        

      # if vertical
        # choose number 1..max, this is the row
        # choose number 1..5, the is the column
        # get the square from the numbers
        # add ship length to get next square(s)

      # break if all squares ship_placed == false


    end
    # place ship_placed = true for all squares
    # add ship positions << position
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

  def set_position(board)
    board.two_available_squares #todo
    position = [3,1], [3,2]
    
    position.each { |sq|
      board.location(sq).ship_placed = true
      ship_positions << sq
    }
  end

end

class Battleship < Ship
  def initialize
    super
    @length = 3
  end

  def status
    puts "Battleship:\t" + super
  end

  def set_position(board)

    position = [[4,2], [4,3], [4,4]] #TODO
    position.each do |sq|
      board.location(sq).ship_placed = true
      ship_positions << sq
    end
  end

end

class Player
  attr_reader :name, :board, :ships

  def initialize(name)
    @name = name.capitalize
    @board = Board.new
    @ships = [ Cruiser.new, Battleship.new, Destroyer.new ]
    set_ship_positions(board)
  end

  def set_ship_positions(board)
    ships.each { |ship| ship.set_position(board) }
  end

  def determine_hit_or_miss(position)
    ships.each do |ship|
      if ship.hit?(position)
        ship.hit!
        ship.destroy! if ship.destroyed?
        break board.hit!(position)
      else
        board.miss!(position)
      end
    end
  end

  def win
    "#{name} wins!"
  end

  private

  def input_to_array(user_input)
    user_input.split(",").map(&:to_i) 
  end

  def is_two_number_array?(user_input)
    user_input.all? {|n| n.is_a?(Fixnum)} && user_input.size == 2
  end

end

class Human < Player

  def choose_position
    loop do
      puts "Please choose a square (such as 3,5) to open fire!"
      choice = gets.chomp
      choice = input_to_array(choice) 
      break choice if is_two_number_array?(choice) && board.square_available?(choice)
      puts "please enter a valid choice"
    end
  end
end

class Computer < Player
  def choose_position
    loop do
      choice = generate_random_choice
      break choice if board.square_available?(choice)
    end
  end

  private

  def generate_random_choice
    [(1..5).to_a.sample, (1..5).to_a.sample]
  end
end

class Game
  attr_accessor :input, :output # I'm for testing
  attr_reader :board, :user, :computer

  def initialize
    self.input  = $stdin # I'm for testing
    self.output = $stdout # I'm for testing
  end

  def play
    @user = Human.new(get_player_name)
    @computer = Computer.new("R2D2")
    announce_winner(play_game_loop)
  end

  def play_game_loop
    loop do
      display_player_board_and_ship_status
      user.determine_hit_or_miss(user.choose_position)
      display_player_board_and_ship_status
      break computer if user.ships.all? { |ship| ship.destroyed? } 
      
      computer.determine_hit_or_miss(computer.choose_position)
      display_player_board_and_ship_status
      break computer if computer.ships.all? { |ship| ship.destroyed? } 
    end
  end

  def announce_winner(player)
    puts player.win
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
    puts "#{user.name}'s Board:"
  end

  def display_player_board_and_ship_status
    system 'clear'
    puts "#{user.name}'s Board:"
    user.board.draw
    user.ships.each {|ship| ship.status}
    puts
    puts "#{computer.name}'s Board:"
    computer.board.draw
    computer.ships.each {|ship| ship.status}
    
  end
end

battle = Game.new
battle.play
# b = Board.new
# p b.rows
# p b.columns

# place a ship:

# horizontal or vertical 
# pick a random square
# pick another if not available
# if the next rows / columns are available to the length the ship
  # place the ship
# else 
  # start again

# next row and column:

# square is chosen i.e 11
# add 1 per length if horizontal row i.e. 12, 13
# if a vertical column, the column (2nd num) changes
# find the square see if taken



