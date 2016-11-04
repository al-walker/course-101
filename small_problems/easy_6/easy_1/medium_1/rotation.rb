require 'pry'
require 'rubocop'

# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.
#
# Do not use the method Array#rotate or Array#rotate! for your implementation.

# input
# array
# processes
# move 1st element to the end of a new array
# output
# new array with original 1st number last

def rotate_array(array)
  new_array = []
  counter = 1
  loop do
    break if array.size == 1
    new_array << array[counter]
    counter += 1
    break if new_array.size == array.size - 1
  end
  new_array << array[0]
  new_array
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
