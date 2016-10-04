sun = ['visible', 'hidden'].sample

puts "The sun is so bright!" if sun == 'visible'

puts "The clouds are blocking the sun!" unless sun == 'visible'

boolean = [true, false].sample

puts boolean ? "I'm true!" : "I'm false!" 

stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'
  puts "Go"
when 'yellow'
  puts 'Slow down'
else
  puts 'Stop'
end

stoplight = ['green', 'yellow', 'red'].sample

if stoplight == 'green'
  puts 'Go!'
elsif stoplight == 'yellow'
  puts 'Slow down!'
else
  puts 'Stop!'
end

status = ['awake', 'tired'].sample

if status == "awake"
  puts 'be productive'
else
  puts "go to sleep"
end

# Reformat the following case statement so that it only takes up 5 lines.

stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green' then puts 'Go!'
when 'yellow' then puts 'Slow down!'
else  puts 'Stop!'
end
