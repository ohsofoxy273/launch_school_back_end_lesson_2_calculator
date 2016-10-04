def teddy_age
  age = rand(20..200)
  puts "Teddy is #{age} years old."
end


SQMETERS_TO_SQFEET = 10.7639

def square_room
  puts "What is the length of the room in meters?"
  length = gets.chomp.to_f

  puts "What is the width of the room in meters?"
  width = gets.chomp.to_f

  meters = length * width
  feet = meters * SQMETERS_TO_SQFEET
  puts "The size of the room is #{meters} square meters and #{feet} square feet"
end


def tip_calculator
  puts "What is the bill?"
  bill = gets.to_f

  puts "What is the tip percentage?"
  tip_percent = gets.to_f

  tip = bill * tip_percent/100.0
  total = bill + tip

  puts "The tip is #{tip}"
  puts "The total is #{total}"
end

=begin
  
 What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!
  
=end

def retirement
  print 'What is your age? '
  current_age = gets.to_i

  print 'At what age would you like to retire? '
  retirement_age = gets.to_i

  current_year = Time.now.year
  work_years_to_go = retirement_age - current_age
  retirement_year = current_year + work_years_to_go

  puts "It's #{current_year}. You will retire in #{retirement_year}. "
  puts  "You have only #{work_years_to_go} years of work to go!"
end


def screamer
  puts "What is your name?"
  name = gets.chomp
  if name[-1] == "!"
    puts "HELLO #{name.upcase.chop}. WHY ARE WE SCREAMING?"
  else
    puts "Hellow #{name}."
  end
end

# (1..99).each {|num| puts num if num.odd? }

# (1..99).each {|num| puts num if num.even? }

=begin

>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.

=end

puts ">> Please enter an integer greater than 0:"
number = gets.chomp.to_i

operator = ''
loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  operator = gets.chomp
  break if (operator == 's' || operator == 'p')
end

if operator == 's'
  answer = (0..number).inject(:+)
  puts answer
else
  answer = (1..number).inject(:*)
  puts answer
end









