require 'pry'

def average(array)
  average = []
  array.each do |int|
    average << int
  end
  average.inject(:+) / array.size
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
