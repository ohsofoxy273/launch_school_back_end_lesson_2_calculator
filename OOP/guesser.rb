class Guesser
  RESULT_MESSAGE = {
    high: 'Your number is too high.',
    lose: 'You are out of guesses. You lose.',
    low:  'Your number is too low.',
    win:  'You win!'
  }.freeze

  def initialize(low, high)
    @range = low..high
    @max_guesses = Math.log2(high - low + 1).to_i + 1
  end

  def play
    reset
    @max_guesses.downto(1) do |remaining_guesses|
      display_guesses_remaining(remaining_guesses)
      result = check_guess(obtain_guess)
      puts RESULT_MESSAGE[result]
      return if result == :win
    end

    puts "", RESULT_MESSAGE[:lose]
  end

  private

  def check_guess(guess_value)
    return :win if guess_value == @secret_number
    return :low if guess_value < @secret_number
    :high
  end

  def display_guesses_remaining(remaining)
    puts
    if remaining == 1
      puts 'You have 1 guess remaining.'
    else
      puts "You have #{remaining} guesses remaining."
    end
  end

  def obtain_guess
    loop do
      print "Enter a number between #{@range.first} and #{@range.last}: "
      guess = gets.chomp.to_i
      break guess if @range.cover?(guess)
      print "Invalid guess. "
    end
  end

  def reset
    @secret_number = rand(@range)
  end
end

game = Guesser.new(501, 1500)
game.play




