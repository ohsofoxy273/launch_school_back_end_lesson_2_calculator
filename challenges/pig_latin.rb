require 'Pry'

class PigLatin

  def self.translate(word)
    word.split.map do |item|
      if starts_with_vowel?(item)
        translate_vowel(item)
      else 
        translate_consonent(item)
      end
    end
    .join(' ')
  end

  def self.starts_with_vowel?(word)
    %w(a e i o u A E I O U).include? word[0]
  end

  def self.translate_vowel(word)
    word + 'ay'
  end

  def self.translate_consonent(word)
    if ['yt', 'xr'].include?(word.slice(0..1))
       word + 'ay'
    elsif ['squ', 'thr', 'sch'].include?(word.slice(0..2))
      word.slice(3..-1) + word.slice(0..2) + 'ay'
    elsif ['ch', 'qu', 'th'].include?(word.slice(0..1)) 
      word.slice(2..-1) + word.slice(0..1) + 'ay'
    else
      word.slice(1..-1) + word[0] + 'ay'
    end
  end


end