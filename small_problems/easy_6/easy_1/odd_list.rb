require 'pry'
require 'rubocop'

# Write a method that returns an Array that contains
# every other element of an Array that is passed in as an argument.
# The values in the returned list should be those values that are in
# the 1st, 3rd, 5th, and so on elements of the argument Array.

# input
# array
#
# processes
# iterate through Array
# print every other element
# array.each do |e|
#
# output
# 1st, 3rd, 5th, etc. element in Array

def oddities(array)
  odd_array = []
  array.each_with_index do |e, idx|
    odd_array << e if idx.even?
  end
  odd_array
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
