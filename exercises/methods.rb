def hello
  "Hello"
end

def world
  "World"
end

puts hello + " " + world

def say_hello
  'Hello'
end

def say_world
  'World'
end

def greet(first_word, second_word)
  "#{first_word} #{second_word}"
end 

puts greet(say_hello, say_world)

def greet
  say_hello + ' ' + say_world
end

puts greet

def car(make, model)
  p "#{make} #{model}"
end 

car('Toyota', 'Corolla')

daylight = [true, false].sample

def time_of_day(day)
  day ? (p "It's daytime") : (p "It's nightime")
end

time_of_day(daylight)

def dog(name)
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat('Ginger')}."

def assign_name(name='Bob')
  name
end

puts assign_name 
puts assign_name('Kevin')

def add(num1, num2)
  num1 + num2
end

def multiply(num1, num2)
  num1 * num2
end

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36

def name(array)
  array.sample
end

def activity(array)
  array.sample
end

def sentence(name, activity)
  "#{name} went #{activity} today."
end

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))

def print_me
  p "I'm printing within the method!" 
end

print_me

def print_me
  "I'm printing the return value!"
end

p print_me

