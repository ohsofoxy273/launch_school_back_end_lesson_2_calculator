

class Scrabble

  SCORE_HASH = {
    1  => %w(A E I O U L N R S T),
    2  => %w(D G),
    3  => %w(B C M P),
    4  => %w(F H V W Y),
    5  => %w(K),
    8  => %w(J X),
    10 => %w(Q Z)
  }

  def initialize(word)
    @word = word
  end

  def score
    return 0 unless word =~ /[a-zA-Z]+/
    word.upcase.split('').map { |letter| score_letter(letter) }.inject(:+)
  end

  def self.score(word)
    self.new(word).score
  end

  private 
  attr_accessor :word

  def score_letter(letter)
    SCORE_HASH.each do |key, val|
      return key if val.include?(letter)
    end
  end

end