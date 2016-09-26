#Q1

10.times { |x| puts " " * x + "The Flintstones Rock!" }

#Q2

statement = "The Flintstones Rock"
statement_hash = {}
statement.each_char do |letter|
  count = 1
  if statement_hash[letter.downcase]
    count += 1
    statement_hash[letter.downcase] = count
  else
    statement_hash[letter.downcase] = count
  end
end

puts statement_hash 

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

#Q3

puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40+2}"

#Q4

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# the array changes

#Q5

def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end

# while dividend > 0 do
#   divisors << number / dividend if number % dividend == 0
#   dividend -= 1
# end

#Q6

#nput changes in the first method

#Q7

LIMIT = 15

def fib(first_num, second_num)
  while second_num < LIMIT
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"


#Q8 

def titleize(string)
  string.split(' ').map {|word| word.capitalize}.join(' ')
end

puts titleize("This is the string")

#Q9

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |family_member| 
  if family_member[1]["age"] < 18
    family_member[1]["age_group"] = "kid"
  elsif family_member[1]["age"] < 65 && family_member[1]["age"] >= 18
    family_member[1]["age_group"] = "adult"
  else 
    family_member[1]["age_group"] = "senior"
  end
end
puts munsters

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end