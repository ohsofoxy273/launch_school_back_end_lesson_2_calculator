car = {
  type:    'sedan',
  color:   'blue',
  mileage: 80_000,
  year:    2003
}

car.delete(:mileage)

puts car

car = {
  type:    'sedan',
  color:   'blue',
  year:    2003
}

puts car[:color]

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

numbers.each {|k,v| puts "A #{k} number is #{v}."}

half_numbers = numbers.map {|k,v| v/2}
puts half_numbers


low_numbers = numbers.select {|k,v| v < 25}
p low_numbers