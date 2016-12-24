puts "How old are you?"
age = gets.chomp

[10, 20, 30, 40].each {|decade| puts "In #{decade} years you will be #{age.to_i + decade} years old."}

10.times {puts age}

