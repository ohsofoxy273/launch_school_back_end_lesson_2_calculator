def show_multiplicative_average(array)
  multiplicative = 1.0
  array.each do |item|
    multiplicative *= item
  end
  average = multiplicative / array.count
  format('%.3f', average)
end

def multiply_list(array1, array2)
  new_array = []
  0.upto(array1.count-1) do |i|
    new_array[i] = array1[i] * array2[i]
  end
  new_array
end

def multiply_list(list_1, list_2)
  products = []
  list_1.each_with_index do |item, index|
    products << item * list_2[index]
  end
  products
end

def multiply_all_pairs(array1, array2)
  multiplicative_array = []
  if array1.size > array2.size
    array1.each do |num1|
      array2.each do |num2|
        multiplicative_array << num1 * num2
      end
    end
  elsif array2.size > array1.size
    array2.each do |num1|
      array1.each do |num2|
        multiplicative_array << num1 * num2
      end
    end

  end
  multiplicative_array.sort

end

def penultimate(string)
  string.split[-2]
end 


p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'