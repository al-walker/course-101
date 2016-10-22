require 'rubocop'

# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers.

# given array of integers
# loop through and sum integers
# average all integers
# return average

def average(array)
  array.inject(:+) / array.size
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
