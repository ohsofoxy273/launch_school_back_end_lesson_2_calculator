def missing(array)
  (array.first..array.last).to_a.select do |integer|
    !array.include?(integer)
  end
end



p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []