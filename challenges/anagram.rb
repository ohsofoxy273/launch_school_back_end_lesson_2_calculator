
class Anagram
  attr_reader :word 

  def initialize(word)
    @word = word
  end

  def match(array)
    array.select do |item|
      selects_sorted(item, word) && invalidates_equal_words(item, word)
    end
  end

  private
  
  def selects_sorted(word, other_word)
    sorts(word) == sorts(other_word)
  end

  def invalidates_equal_words(word, other_word)
    word.downcase != other_word.downcase
  end

  def sorts(word)
    word.downcase.chars.sort.join
  end
end