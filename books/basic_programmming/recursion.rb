def user_input
  loop do
    puts "Enter a number from 10 to 100."
    number = gets.chomp.to_i
    return number if number >= 10 && number <= 100
  end
end

def count_down(number)
  if number == 1
    puts "Zero!"
  else
    puts number -= 1
    count_down(number)
  end
end

number = user_input

count_down(number)