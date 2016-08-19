require 'pry'

def average(array)
  average = []
  array.each do |int|
    average << int
  end
  (average.inject(:+) / array.size).to_f
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
puts average([2.5, 2.5, 2.5, 2.5]) == 2.5
