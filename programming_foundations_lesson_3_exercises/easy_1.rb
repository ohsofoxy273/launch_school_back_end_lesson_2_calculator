#Q 1
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

#A [1,2,2,3]

#Q 2

what is != and where should you use it?; not equal to, comparing booleans
put ! before something, like !user_name; not something 
put ! after something, like words.uniq!; change something permanently
put ? before something; 
put ? after something; tell that it returns a boolean;
put !! before something, like !!user_name; convert to boolean

#Q 3

advice = "Few things in life are as important as house training your pet dinosaur."
advice.sub! 'important', 'urgent'

#Q4

numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1) # [1, 3,4, 5]
numbers.delete(1) # [2,3,4,5]

#Q5 

(10..100).include?(42)

#Q6 

famous_words = "seven years ago..."

famous_words = "Four score and " + famous_words

famous_words[0] =  "Four score and "

famous_words.prepend("Four score and ")

"Four score and " << famous_words

#Q7

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

42

#q8

flintstones.flatten!

#Q9

flintstones.assoc("Barney")

#Q10

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flint_hash = {}
flintstones.each do |item|
  flint_hash[item] = flintstones.index(item)
end

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end





