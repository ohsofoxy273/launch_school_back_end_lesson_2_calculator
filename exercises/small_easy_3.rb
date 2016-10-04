def prompt(string)
  puts "==> #{string}"
end

=begin

numbers = []
prompt "Enter the 1st number"
numbers << gets.to_i
prompt "Enter the 2nd number"
numbers << gets.to_i
prompt "Enter the 3rd number"
numbers << gets.to_i
prompt "Enter the 4th number"
numbers << gets.to_i
prompt "Enter the 5th number"
numbers << gets.to_i
prompt "Enter the last number"
final = gets.to_i

if numbers.include?(final)
  puts "#{final} is in #{numbers}"
else
  puts "#{final} is not in #{numbers}"
end

=end

=begin

prompt("Enter the first number:")
first = gets.to_i
prompt("Enter the second number:")
second = gets.to_i

prompt("#{first} + #{second} = #{first + second}")
prompt("#{first} - #{second} = #{first - second}")
prompt("#{first} x #{second} = #{first * second}")
prompt("#{first} / #{second} = #{first / second}")
prompt("#{first} % #{second} = #{first % second}")
prompt("#{first} ** #{second} = #{first ** second}")

=end

=begin

prompt "Please write word or multiple words:"
words = gets.chomp
chars = words.split(%r{\s*}).count
# or chars  = input.delete(' ').size
puts "There are #{chars} characters in #{words}"

=end

def multiply(first_num, second_num)
  first_num * second_num
end

def square(num)
  multiply(num, num)
end

def xor?(arg_1, arg_2)
  return true if arg_1 && !arg_2
  return true if arg_2 && !arg_1
  false
end

def oddities(array)
  odds = []
  array.each_with_index do |item, index|
    odds << item if index % 2 == 0
  end
  odds
end

def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end

def palindrome?(string)
  string == string.reverse
end

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

def palindromic_number?(number)
  panindrome?(number.to_s)
end












