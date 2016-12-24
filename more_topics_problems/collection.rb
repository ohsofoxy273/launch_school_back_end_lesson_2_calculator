#each, select, reduce, map

class Collection

  def each(array)
    iterator = 0
    while iterator < array.length
      yield(array[iterator])
      iterator += 1
    end
    array
  end

  def selecty(array)
    iterator = 0
    return_array = []
    while iterator < array.length
      return_array << array[iterator] if yield(array[iterator]) == true
      iterator += 1
    end
    return_array
  end

  def reducey(array, default = 1)
    iterator = 1
    return_value = default
    while iterator < array.length
      return_value = yield(return_value, array[iterator])
      iterator += 1
    end
    return_value
  end

  def mapy(array)
    iterator = 0
    return_array = []
    while iterator < array.length
      return_array << yield(array[iterator])
      iterator += 1
    end
    return_array
  end
end



def greet(name, age)
  puts "Hello, my name is #{name}"
  puts "I will be #{yield(age)} soon." if block_given?
  puts "It's a pleasure to meet you"
end

greet("Joe", 15) { |age| "#{age + 5}"}







