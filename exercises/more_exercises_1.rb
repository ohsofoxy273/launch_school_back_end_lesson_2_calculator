require 'pry'
def is_prime?(number)
  index = 2
  return false if number == 1
  index.upto(number-1) do
    return false if (number % index == 0)
    index +=1
  end
  true
end

def select_primes(array)
  return_array = []
  array.each { |item| return_array << item if is_prime?(item) }
  return_array
end

def count_primes(array)
  select_primes(array).count
end


def sum_or_product
  puts "Enter an integer"
  int = gets.chomp.to_i
  
  loop do
    puts "Enter 's' to compute the sum and 'p' to compute the product."
    operation = gets.chomp.downcase

    if operation == 's'
      return (1..int).inject(:+)
    elsif operation == 'p'
      return (1..int).inject(:*)
    end
  end
end

def interleave(array1, array2)
  new_array = []
  0.upto(array1.length-1) do |index|
    new_array << array1[index]
    new_array << array2[index]
  end
  new_array
end 

#######

def substring(string, first_index, second_index=false)
  return string[first_index..second_index]if second_index
  string[first_index]
end

# a wrong way
def substrings(string)
  first_index = 0
  second_index = 1
  array = []
  while first_index < string.size
    while second_index < string.size
      array << substring(string, first_index, second_index)
      second_index +=1
    end
    first_index += 1
  end
  array
end

# a right way
def substrings(string)
  results = []
  string.chars.each_with_index do |letter, index|
    position = index + 1
    (string.size - position).times do |n|
      results << substring(string, index, index+n+1)
    end
  end
  results
end

def palindromes(string)
  substrings = substrings(string)
  palindrome_array = []
  substrings.each {|substring| palindrome_array << substring if substring == substring.reverse }
  palindrome_array
end

def largest_palindrome(string)
  palindromes(string).max_by(&:length)
end

###

def convert_english(array)
  array.each_slice(3).to_a
end

def computer(english)
  numbers = {"zero" => 0, "one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5,
              "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9}
  
  word_array = english.split
  word_array.each_with_index do |word, index|
    word_array[index] = numbers[word] if numbers[word]
  end
  
  loop do
    break if !word_array.include?('plus') && !word_array.include?('minus') && !word_array.include?('times') && !word_array.include?('divided by') &&
    first_three = word_array.take(3)
    first_num = first_three.first 
    second_num = first_three.last 
    operator = first_three[0]
    solution = case operator
               when 'plus' then first_num + second_num
               when 'minus' then first_num - second_num
               when 'times' then first_num * second_num
               when 'divided by' then first_num / second_num
               end
    word_array.shift(3)
    word_array.unshift(solution)
  end
    word_array
end

def word_cap(words)
  new_words = ''
  words.split.each { |word| new_words = new_words + word.capitalize + " " }
  new_words[0..-2]
end

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end

require 'Date'
def friday_13(year)
  date = Date.new(year)
  friday_13 = 0
  while date.year < year + 1
    friday_13 += 1 if date.friday? && date.day == 13
    date = date.next_day
  end
  friday_13
end

def mathphrase(num)
  numbers = %w(one two three four five six seven eight nine)
  operators = %w(plus minus times divided)
  return_string = ''
  num.times do
    return_string += "#{numbers.sample} #{operators.sample} #{numbers.sample} "
  end
  return_string[0..-2].gsub("divided", "divided by")
end

def random_math_phrase
  num = rand(20)
  mathphrase(num)
end

def reverse_string(string)
  new_string = ''
  counter = string.size
  counter.times do
    new_string << string[counter - 1]
    counter -= 1
  end
  new_string
end



def fizzbuzz(first_num, second_num)
  (first_num..second_num).each do |i|
    if i % 3 == 0 && i % 5 == 0
     puts "fizzbuzz"
    elsif i % 3 == 0
      puts 'fizz'
    elsif i % 5 == 0
      puts "buzz"
    else
      puts i
    end
  end 
end


PRODUCTS = [
  { name: "Thinkpad x210", price: 220 },
  { name: "Thinkpad x220", price: 250 },
  { name: "Thinkpad x250", price: 979 },
  { name: "Thinkpad x230", price: 300 },
  { name: "Thinkpad x230", price: 330 },
  { name: "Thinkpad x230", price: 350 },
  { name: "Thinkpad x240", price: 700 },
  { name: "Macbook Leopard", price: 300 },
  { name: "Macbook Air", price: 600 },
  { name: "Macbook Pro", price: 700 },
  { name: "Macbook", price: 1449 },
  { name: "Dell Latitude", price: 200 },
  { name: "Dell Latitude", price: 650 },
  { name: "Dell Inspiron", price: 300 },
  { name: "Dell Inspiron", price: 450 }
]
query = {
  price_min: 240,
  price_max: 280,
  q: 'thinkpad'
}
query2 = {
  price_min: 300,
  price_max: 600,
  q: 'dell'
}
def search(query)
  product_name_array = []
  query_name = query[:q]
  
  PRODUCTS.each do |product|
    product_name_array << product if product[:name].downcase.include?(query_name)
  end

  price_min = query[:price_min]
  price_max = query[:price_max]
  price_array = []
  product_name_array.each do |product|
    price_array << product if (product[:price] >= price_min && product[:price] <= price_max)
  end
  price_array
 
end

def search(query)
  
  query_name = query[:q]
  price_min = query[:price_min]
  price_max = query[:price_max]
  
  PRODUCTS.select do |product|
    product[:name].downcase.include?(query_name) && (price_min..price_max).include?(product[:price]) 
  end 
end


#search(query)
# [ { name: "Thinkpad x220", price: 250 } ]
#search(query2)
# [ { name: "Dell Inspiron", price: 300 }, { name: "Dell Inspiron", price: 450 } ]


def remove_vowels_from_array(array_of_strings)
  array_of_strings.map { |string| string.delete("aeiouAEIOU") }
end


def balancer(string)
  return false unless string.count("(") == string.count(")")
  paren_count = 0
  string.chars.each { |char| 
    paren_count += 1 if char == "("
    paren_count -= 1 if char == ")"
    return false if paren_count < 1
  }
  true
end

def is_prime?(num)
  (2..num-1).each do |number|
    return false if num % number == 0
  end

end

def find_primes(first_num, second_num)
  prime_array = []
  (first_num..second_num).each do |num|
    if num > 1
      prime_array << num if is_prime?(num)
    end
  end
  prime_array

end












