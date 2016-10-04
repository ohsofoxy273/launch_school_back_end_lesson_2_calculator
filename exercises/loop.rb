# iterations = 1

# loop do
#   puts "Number of iterations = #{iterations}"
#   iterations += 1
#   break if iterations > 5
# end

# loop do
#   puts 'Should I stop looping?'
#   answer = gets.chomp
#   break if answer == 'yes'
# end

# say_hello = true
# count = 0

# while say_hello
#   puts 'Hello!'
#   count += 1
#   say_hello = false if count == 5
# end

# numbers = (0..99).to_a
# count = 0

# while count < 5
#   puts numbers.sample
#   count += 1
# end

# numbers = []

# while numbers.size < 5
#   numbers << rand(100)
# end

# puts numbers


# count = 0

# until count > 10
#   puts count
#   count += 1
# end

# numbers = [7, 9, 13, 25, 18]
# count = 0

# until  count > numbers.size
#   puts numbers[count]
#   count += 1
# end

# for i in 1..100
#   puts i if i.odd?
# end

# friends = ['Sarah', 'John', 'Hannah', 'Dave']

# for each_friend in friends
#   puts "Hello #{each_friend}!"
# end

# count = 1

# loop do
#   count += 1
# end

# count = 1

# loop do
#   puts "#{count} is #{count.odd? ? "odd" : "even"}!"
#   count += 1
#   break if count > 5
# end

# loop do
#   number = rand(100)
#   break if number < 10
#   puts number
# end


# process_the_loop = [true, false].sample

# if process_the_loop
#   loop do
#     puts "The loop was processed!"
#     break
#   end
# else 
#   puts "The loop wasn't processed!"
# end

# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
#   if answer == 4
#     puts "That's correct!"
#     break
#   else
#     puts "Wrong answer. Try again!"
#   end
# end



####### XXXXXXXXXXXXXXXXX 
# numbers = []

# loop do
#   puts 'Enter any integer:'
#   input = gets.chomp
#   if input.is_a?(Integer)
#     numbers.push(input)
#     break if numbers.length == 5
#   else
#     puts "Enter an integer."
#   end
# end

# puts numbers

######## XXXXXXXXXXXXXXXXX


# names = ['Sally', 'Joe', 'Lisa', 'Henry']

# loop do
#   break if names.empty?
#   puts names.pop
# end

# 5.times do |index|
#   break if index == 2
#   puts index
# end

# number = 0

# until number == 10
#   number += 1
#   next if number.odd?
#   puts number
# end

# number_a = 0
# number_b = 0

# loop do
#   number_a += rand(2)
#   number_b += rand(2)

#   if number_a < 5 || number_b < 5
#     next
#   else
#     puts "5 was reached!"
#     break
#   end
# end

# def greeting
#   puts 'Hello!'
# end

# number_of_greetings = 2

# while  number_of_greetings > 0
#   greeting
#   number_of_greetings -= 1
# end




