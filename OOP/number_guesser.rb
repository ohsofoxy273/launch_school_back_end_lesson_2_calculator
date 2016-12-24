###Create an object-oriented number guessing class for numbers in the range 1 to 100, with a maximum limit of 7 guesses per game. The game should play like this:

#nouns: game, guess?, player

class PingGame
  attr_reader :guess, :correct_number

  def initialize
    @guess = Guess.new(7)
    @correct_number = rand(1..100)
  end

  def play
    loop do 
      guess.display_remaining
      number = choose_a_number
      break if Guess.win?(number, correct_number)
      Guess.evaluate(number, correct_number)
      guess.remaining_guesses -= 1
      if guess.remaining_guesses == 0
        puts "You are out of guesses. You lose!"
        break
      end
    end
  end

  private

  def choose_a_number
    loop do 
      puts "Enter a number between 1 and 100: "
      num = gets.chomp.to_i
      break num if num > 0 && num <= 100 && num.to_i.to_s.to_i == num
      puts "Invalid guess."
    end
  end

end

class Guess
  attr_accessor :remaining_guesses

  def initialize(remaining_guesses)
    @remaining_guesses = remaining_guesses
  end

  def display_remaining
    puts "You have #{remaining_guesses} guesses remaining."
  end

  def self.evaluate(number, correct_number)
    if number < correct_number
      puts "Your guess is too low."
    else
      puts "Your guess is too high."
    end
  end

  def self.win?(number, correct_number)
    #binding.pry
    if number == correct_number
      puts "You win!"
      return true
    else
      return false
    end
  end
end




game = PingGame.new
game.play
