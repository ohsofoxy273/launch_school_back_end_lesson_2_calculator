def repeat(string, integer)
  integer.times { puts string }
end

repeat('Hello', 3)

def is_odd?(num)
  num.to_i.abs % 2 == 1 
end

def digit_list(num)
  num.to_s.split('').map! {|n| n.to_i}
end


vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(arr)
  items = {}
  arr.each do |item|
    items[item] = arr.count(item)
  end
  items.each {|k,v| puts "#{k} => #{v}"}
end

count_occurrences(vehicles)


def reverse_sentence(string)
  string.split.reverse.join(' ')
end
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'


def reverse_words(string)
  new_string_arr = string.split.each {|word| word.reverse! if word.size >= 5}
  new_string_arr.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS


def stringy(num)
  num % 2 == 0 ? '10' * (num / 2) : '10' * (num / 2) + '1'
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'


####

def average(arr)
  arr.reduce(:+) / arr.length
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

def sum(num)
  num.to_s.split('').map! {|n| n.to_i}.inject(0) {|sum, x| sum +x}
end

# better:

def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

###

def calculate_bonus(salary, bonus_boolean)
  bonus_boolean ? salary / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

