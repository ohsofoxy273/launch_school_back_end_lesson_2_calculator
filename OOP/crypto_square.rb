require 'pry'

class Crypto
  attr_reader :string
  
  def initialize(string)
    @string = string
  end

  def normalize_plaintext
    string.scan(/[\w+]/).join.downcase
  end

  def size
    length = normalize_plaintext.size
    Math.sqrt(length).ceil
  end

  def plaintext_segments
    return_string = ""
    self.normalize_plaintext.chars.each_with_index do |char, index|
      return_string << " " if index % self.size == 0
      return_string << char
    end
    return_string.split
  end

  def ciphertext
    plaintext_array = self.plaintext_segments
    return_string = ""
    index = 0
    self.size.times do 
      plaintext_array.each do |word|
        return_string << word[index] unless word[index].nil?
      end
      index += 1
    end
    return_string
  end

  def normalize_ciphertext
    
  end

end

                0