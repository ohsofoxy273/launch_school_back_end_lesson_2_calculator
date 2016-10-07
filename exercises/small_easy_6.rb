require 'pry'

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

def remove_vowels(array)
  new_array = []
  array.each do |item|
    new_array << item.delete("aeiouAEIOU")
  end
  new_array
end

def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end

def find_fibonacci_index_by_length(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci
  end

  index
end

def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

def reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end

def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

def merge(array_1, array_2)
  array_1 | array_2
end

def halvsies(array)
  half_length = array.length / 2 
  first_array = array.length.odd? ? array[0..half_length] : array[0..half_length-1]
  second_array = array.length.odd? ? array[(half_length+1)..array.length] : array[half_length..array.length]
  new_array = [first_array, second_array]
end

def halvsies(array)
  first_half = array.slice(0, (array.size / 2.0).ceil)
  second_half = array.slice(first_half.size, array.size - first_half.size)
  [first_half, second_half]
end

def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end

def include?(array, value)
  array.each do |item|
    return true if value == item
  end
  false
end

def include?(array, value)
  !!array.find_index(value)
end

def triangle(num)
  num.times do |stars|
    puts ' ' * num + '*' * (stars + 1)
    num -= 1
  end
end

def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end

def interleave(array1, array2)
  array1.zip(array2)
end

def letter_case_count(string)
  i = 0
  hash = {lowercase: 0, uppercase: 0, neither: 0}
  while i < string.length
    if ("a".."z").include?(string[i])
      hash[:lowercase] = hash[:lowercase] + 1
    elsif ("A".."Z").include?(string[i])
      hash[:uppercase] = hash[:uppercase] + 1
    else
      hash[:neither] = hash[:neither] + 1
    end
    i += 1
  end
  hash
end

def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end

def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end

def staggered_case(string)
  result = ''
  capitalize = true
  string.chars.each do |char|
    if char =~ /[a-z]/i
      if capitalize
        result += char.upcase
      else
        result += char.downcase
      end
      capitalize = !capitalize
    else
      result += char
    end
  end
  result
end






