require('pry')

def greetings(array, hash)
  person_name = array.join(' ')
  title = hash[:title]
  occupation = hash[:occupation]

  puts "Hello, #{name}! Nice to have a #{title} #{occupation} around."
end


def double_number?(num)
  if num.to_s.size.odd?
    return false
  elsif num.to_s[0..(num.to_s.size-1)/2] == num.to_s[(num.to_s.size)/2..-1]
    return true
  else
    return false
  end
end

def twice(num)
  double_number?(num) ? num : num * 2
end

def negative(num)
  num <= 0 ? num : -num
end

def sequence(num)
  array = []
  1.upto(num) do |number|
    array << number
  end
  array
end

def sequence(number)
  (1..number).to_a
end

def uppercase?(string)
  string.chars.each do |letter|
    return false if "abcdefghijklmnopqrstuvwxyz".include?(letter)
  end
  true
end

def uppercase?(string)
  string == string.upcase
end

def word_lengths(string)
  string.split.map { |word| word + " " + word.size.to_s }
end

def swap_name(name)
  name.split[1] + ", " + name.split[0]
end

def swap_name(name)
  name.split(' ').reverse.join(', ')
end

def sequence(count, number)
  return_array = [number]
  return [] if count == 0
  (count-1).times do 
    return_array << return_array.last + number
  end
  return_array
end

def sequence(count, first)
  (1..count).map { |idx| idx * first }
end

def get_grade(*grades)
  average = grades.inject(:+) / grades.count.to_f
  
  case average
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

def buy_fruit(fruit_array)
  fruit_basket_array = []
  fruit_array.each do |array|
    array[1].times { fruit_basket_array << array[0] }
  end
  fruit_basket_array
end

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end




