require 'pry'

FIRST_PLAYER = 'player' # player, computer, or choose

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [
                  [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
                  [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
                  [1, 5, 9], [3, 5, 7] # diag
                ]


def prompt(phrase)
  puts "=> #{phrase}"
end

def joinor(arr, delimiter=', ', word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
end

def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}, computer is a #{COMPUTER_MARKER}."
  puts ""
  puts "      |      |"
  puts "  #{brd[1]}   |   #{brd[2]}  |   #{brd[3]}"
  puts "      |      |"
  puts "------+------+------"
  puts "      |      |"
  puts "  #{brd[4]}   |  #{brd[5]}   |   #{brd[6]}"
  puts "      |      |"
  puts "------+------+------"
  puts "      |      |"
  puts "  #{brd[7]}   |   #{brd[8]}  |   #{brd[9]}"
  puts "      |      |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |number| new_board[number] = INITIAL_MARKER }
  new_board
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def player_places_piece!(board)
  square = ''
  loop do
    prompt "Choose a square: (#{joinor(empty_squares(board))}):"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  board[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil

  # offense first
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # defense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    square = 5
  end

  # just pick a square
  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    # if board[line[0]] == PLAYER_MARKER &&
    #    board[line[1]] == PLAYER_MARKER &&
    #    board[line[2]] == PLAYER_MARKER
    #   return 'Player'
    # elsif board[line[0]] == COMPUTER_MARKER &&
    #       board[line[1]] == COMPUTER_MARKER &&
    #       board[line[2]] == COMPUTER_MARKER
    #   return 'Computer'
    # end
    if board.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif board.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select{|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end
end

def place_piece!(board, current_player)
  current_player == 'player' ? player_places_piece!(board) : computer_places_piece!(board)
end

def alternate_player(current_player)
  if current_player == 'player'
    current_player = 'computer'
  else
    current_player = 'player'
  end
end


player_wins = 0
computer_wins = 0
loop do
  board = initialize_board
  
  if FIRST_PLAYER == 'choose'
    puts 'choose who goes first, player or computer'
    player_answer = gets.chomp
    current_player = 'player' if player_answer.downcase.start_with?('p')
    current_player = 'computer' if player_answer.downcase.start_with?('c')
  else
    current_player = FIRST_PLAYER
  end

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board) && detect_winner(board) == 'Player'
    prompt "#{detect_winner(board)} won!"
    player_wins += 1
  elsif someone_won?(board) && detect_winner(board) == 'Computer'
    prompt "#{detect_winner(board)} won!"
    computer_wins += 1
  else
    prompt "It's a tie!"
  end

  prompt "Would you like to play again? (y or n)?"
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
  if player_wins == 5 || computer_wins ==5
    puts "Player wins!" if player_wins == 5
    puts "Computer wins!" if computer_wins == 5 
    break
  end
end


prompt "Thanks for playing Tic Tac Toe. Goodbye!"
