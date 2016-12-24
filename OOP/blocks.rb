def select(array)
  counter = 0
  result = []

  while counter < array.size
    result << array[counter] if yield(array[counter])
    counter += 1
  end
  result
end


def reduce(array, default=0)
  counter = 0
  accumulator = default
  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end
  accumulator
end


