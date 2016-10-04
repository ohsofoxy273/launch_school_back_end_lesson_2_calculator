# puts "Input something"
# input = gets.chomp
# puts input


# puts "What is your age in years?"
# age_in_years = gets.chomp

# age_in_months = age_in_years.to_i * 12

# puts "You are #{age_in_months} months old"

# loop do
#   puts "Do you want me to print something (y/n)"
#   answer = gets.chomp

#   if answer.downcase == "y"
#     puts "something"
#     break
#   else
#     puts "try again"
#   end
# end

# loop do
#   puts "How many lines of this do you want printed?"
#   lines = gets.chomp.to_i
#   if lines < 3
#     puts "Enter at least 3."
#     next
#   else
#     lines.times { puts 'Launch School is the best!' }
#     break
#   end
# end

# PASSWORD = "password"

# loop do 
#   puts "Enter the password"
#   password = gets.chomp
#   break if password == PASSWORD
#   puts "Incorrect password"
# end

# PASSWORD = "password"
# USER = "Person"

# loop do 
#   puts "Enter your username"
#   user = gets.chomp

#   puts "Enter the password"
#   password = gets.chomp
  
#   break if password == PASSWORD && user == USER
#   puts "Authorization failed."
# end

######################

# def valid_number?(number_string)
#   number_string.to_i.to_s == number_string
# end

# numerator = ""
# denominator = ""

# loop do 
#   puts "Please enter the numerator:"
#   numerator = gets.chomp
#   if valid_number?(numerator)
#     break
#   else
#     puts "Invalid input. Only integers are allowed."
#   end
# end

# loop do 
#   puts "Please enter the denominator:"
#   denominator = gets.chomp
#   unless valid_number?(denominator) || denominator == 0
#     puts "Invalid input. Only integers are allowed."
#   else
#     break
#   end
# end

# puts "the answer is #{numerator.to_i / denominator.to_i}"

#########################

# loop do 
#   number_of_lines = nil
#   loop do
#     puts '>> How many output lines do you want? Enter a number >= 3:'
#     number_of_lines = gets.to_i
#     break if number_of_lines >= 3
#     puts ">> That's not enough lines."
#   end

#   while number_of_lines > 0
#     puts 'Launch School is the best!'
#     number_of_lines -= 1
#   end

#   puts "more? (q or Q if you want to quit)"
#   quit = gets.chomp
#   break if quit.downcase.start_with?("q") 
# end

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

loop do
  puts "Enter a positive and negative integer, the order does not matter"
  puts "First integer:"
  first_int = gets.chomp

  puts "Second integer:"
  second_int = gets.chomp

  if first_int.to_i == 0 || second_int.to_i == 0
    puts "Invalid input. Only non-zero integers are allowed."
  elsif !valid_number?(first_int) || !valid_number?(second_int)
    puts "Invalid, try again"
  elsif  (first_int.to_i < 0 && second_int.to_i > 0) || (first_int.to_i > 0 && second_int.to_i < 0)
    puts "#{first_int} + #{second_int} = #{first_int.to_i + second_int.to_i}"
    break
  else
    puts "Those aren't correct, try again."
  end 
end 














