#Q1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#Q2

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"

#Q3

flintstones.push("Dino").push("Hoppy")
flintstones.concat(%w(Dino Hoppy)) 

#Q4

advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!(0, advice.index('house'))

# Q5

statement = "The Flintstones Rock!"

statement.scan('t').count

# Q6

title = "Flintstone Family Members"
title.center(40)
