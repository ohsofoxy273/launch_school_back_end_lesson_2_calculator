require 'pry'

def rotate_array(array)
  array[1..-1] + [array.first]
end

def rotate_string(string)
  rotate_array(string.split('')).join("")
end

def rotate_integer(int)
  rotate_string(int.to_s).to_i
end

def rotate_rightmost_digits(num, rotation)
  return num if rotation == 0 || rotation == 1
  string_array = num.to_s.split('')
  (string_array[0..-rotation-1] + rotate_array(string_array[-rotation..-1])).join('').to_i
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

def max_rotation(int)
  length = int.to_s.size
  loop do
    return int if length == 1
    int = rotate_rightmost_digits(int, length)
    length -= 1
  end
end


def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end

def switch(light_boolean)
  !light_boolean
end

def lights_on(number_of_lights)
  lights_array = Array.new(number_of_lights, false)
  num = number_of_lights
  iterator = 1

  num.times do
    lights_array.each_with_index do |light, index| 
      lights_array[index] = switch light if (index+1) % iterator == 0
    end
    iterator +=1
  end

  lights_off = lights_array.each_index.select{|i| lights_array[i] == false}.map! {|value| value + 1}
  puts "There are #{lights_array.count(true)} on."
  puts "The lights off include #{lights_off}"

end


def diamond(odd_number)
  row = 1
  spaces = (odd_number - 1)/2
  spaces.times do
    puts (' ' * spaces) + '*' * row
    spaces -= 1 
    row += 2
  end
  puts '*' * odd_number
  
  row = 1
  stars = (odd_number - 1)/2
  stars.times do 
    puts (' ' * row) + '*' * (stars * 2 - 1)
    stars -= 1
    row += 1
  end
end

###

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

###

def diamond(size)
  (1...size).step(2) { |n| puts ('*' * n).center(size) }

  (-size..-1).step(2) { |n| puts ('*' * -n).center(size) }
end

















