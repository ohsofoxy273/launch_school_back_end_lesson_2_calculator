require 'Pry'

def any?(array, &block)
  array.each do |item|
    return true if yield(item) 
  end
  false
end

def none?(array, &block)
  array.each do |item|
    return false if yield(item)
  end
  true
end

def one?(array, &block)
  array.select do |item|
    yield(item)
  end
  .count == 1 
end

def count(array, &block)
  count = 0
  array.each { |item| count+=1 if yield(item) }
  count 
end

def step(start_val, end_val, step, &block)
  loop do
    yield start_val
    break if start_val >= end_val
    start_val += step
  end
end

def zip(array1, array2)
  index = 0
  array = []
  loop do 
    break if index >= array1.size
    array << [array1[index], array2[index]]
    index += 1
  end
  array
end

def map(arr, &block)
  return_array = []
  arr.each { |item| return_array << yield(item) }
  return_array
end

def count(*args, &block)
  count = 0
  args.each { |item| count += 1 if yield(item) }
  count
end

def drop_while(arr, &block)
  arr.each_with_index do |item, index|
    return arr[index..-1]  if !yield(item)
  end
  []
end

def each_with_index(arr, &block)
  index = 0
  arr.each do |item|
    yield(item, index)
    index += 1
  end
end

def each_with_object(arr, obj, &block)
  arr.each do |item|
    yield(item, obj)
  end
  obj
end

def max_by(arr, &block)
  return nil if arr.empty?
  new_array = []
  arr.each { |item| new_array << yield(item) }
  index = new_array.index(new_array.max)
  arr[index]
end

def each_cons(array, &block)
  index = 0
  loop do 
    break if index == array.length - 1
    yield(array[index], array[index+1])
    index += 1  
  end
  nil
end

def each_cons(array, n)
  array.each_index do |index|
    break if index + n - 1 >= array.size
    yield(*array[index..(index + n - 1)])
  end
end

