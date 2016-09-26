#q1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages["Spot"]

ages.assoc("Spot")

ages.has_key?("Spot")

ages.key?("Spot")

ages.include?("Spot")

ages.member?("Spot")

#Q2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
sum = 0
ages.each_value { |value| sum += value}

ages.values.inject(:+)

#Q3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if {|name, age| age >= 100 }

ages.keep_if { |_, age| age < 100 }

#Q4

munsters_description = "The Munsters are creepy in a good way."

munsters_description.downcase.capitalize

munsters_description.capitalize

munsters_description.swapcase

munsters_description.downcase

munsters_description.upcase


#Q5

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)

#Q6

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.min

#Q7

advice = "Few things in life are as important as house training your pet dinosaur."

advice.include?("Dino")

advice.match("Dino")

#Q8

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.index { |name| name[0, 2] == "Be" }

#Q9 and 10

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! {|name| name[0..2] }

flintstones.map! do |name|
  name[0, 3]
end

flintstones.map! { |name| name[0,3] }



