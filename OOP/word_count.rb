
require 'pry'
class Phrase
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    occurrences = {}
    array = split_phrase(phrase)
    array.uniq.each do |element|
      occurrences[element] = array.count(element)
    end
    occurrences
  end

  private

  def split_phrase(phrase)
    phrase_array = phrase.scan(/[\w']+/)
    .map(&:downcase)
    remove_quotes(phrase_array)
  end

  def remove_quotes(array)
    return_array = []
    array.each do |word|  
      return_array << (is_quoted_word?(word) ? word[1..-2] : word)
    end
    return_array
  end

  def is_quoted_word?(word)
    word[0] == "'" && word[-1] == "'"
  end

end

phrase = Phrase.new("one of each")
phrase.word_count
