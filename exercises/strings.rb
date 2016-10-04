string = String.new

puts %Q(It's now 12 o'clock.)
puts %q(It's now 12 o'clock.)

name = 'Roger'

puts name.casecmp('RoGeR') == 0
puts name.casecmp('DAVE') == 0

state = 'tExAs'
puts state.capitalize

###

greeting = 'Hello!'

greeting.gsub!('Hello', 'Goodbye')
puts greeting

###

alphabet = 'abcdefghijklmnopqrstuvwxyz'
alphabet.split('').each { |letter| puts letter }
puts alphabet.split('') # better than the above

words = 'car human elephant airplane'
words.split.each {|word| puts word + 's'}



colors = 'blue pink yellow orange'

puts colors.split.include?('yellow')
puts colors.split.include?('purple')




