
class Series
  def initialize(input_string)
    @input_string = input_string.split('').map(&:to_i)
  end

  def slices(num)
    raise ArgumentError if num > input_string.size
    index, return_array = 0, []
    slice_array(input_string, num)
  end

  private
  attr_reader :input_string


  def slice_array(char_array, num)
    index, return_array = 0, []
    loop do
      return_array << char_array[index..(index + num - 1 )]
      index += 1 
      break if index == char_array.size + 1 - num
    end
    return_array
  end
end

class Series
  attr_reader :numbers

  def initialize(string)
    @numbers = string.each_char.map(&:to_i)
  end

  def slices(count)
    raise ArgumentError, 'n is too big for the string.' if count > numbers.length
    numbers.each_cons(count).to_a
  end
end