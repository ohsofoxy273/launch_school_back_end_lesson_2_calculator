require 'pry'

def sum_of_sums(array)
  sum = 0
  
  loop do 
    sum += array.inject(:+)
    array.pop
    break if array.length == 0
  end
  sum
end


def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end


def madlibs
  puts "Enter a noun: "
  noun = gets.chomp
  puts "Enter a verb:" 
  verb = gets.chomp
  puts "Enter an adjective: "
  adjective = gets.chomp
  puts "Enter an adverb:"
  adverb = gets.chomp

  puts "Do you #{verb} your #{adjective} #{noun} #{adverb}?" 
end

def substrings_at_start(string)
  string_array = []
  counter = 0
  string.size.times do 
    string_array << string[0..counter]
    counter += 1
  end
  string_array
end

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(substrings_at_start(this_substring))
  end
  results
end

def palindromes(string)
  all_substrings = substrings(string)
  results = []
  all_substrings.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end

#if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz",
# and finally if a number is divisible by 3 and 5, print "FizzBuzz".

def fizzbuzz(num1, num2)
  num1.upto(num2) do |num|
    fizzbuzz = num % 5 == 0 && num % 3 ==0
    fizz = num % 3 == 0
    buzz = num % 5 == 0 

    case 
    when fizzbuzz then p "FizzBuzz"
    when fizz then p "Fizz"
    when buzz then p "Buzz"
    else p num
    end
  end
end

def repeater(string)
  string.chars.map { |item| item * 2 }.join("")
end

def double_consonants(string)
  string.chars.map { |item| 
    if %w(b c d f g h j k l m n p q r s t v w x y z).include?(item.downcase)
      item * 2
    else
      item 
    end 
  }.join("")
end

def reversed_number(num)
  reversed_array = num.to_s.reverse.chars
  reversed_array.each { |number| 
    if number == '0'
      reversed_array.shift
    else
      break
    end
  }

  reversed_array.join('').to_i

end

def center_of(string)
  center = string.size / 2
  string.size.odd? ? string[center] : string[center-1] + string[center]
end



















