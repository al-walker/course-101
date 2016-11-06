require 'pry'
require 'pry-nav'
require 'rubocop'
require_relative 'rotation2'
# Write a method that takes an integer as argument,
# and returns the maximum rotation of that argument.
# You can (and probably should) use the rotate_rightmost_digits
# method from the previous exercise.

# input
# integer
#
# processes
# number.to_s.chars (int to string split string into array)
# to end 1st, 2nd, 3rd, 4th, 5th
#
# output
# maximum rotation

def max_rotation(number)
  max = 0
  counter = number.to_s.chars.size
  loop do
    max = rotate_rightmost_digits(number, counter)
    counter -= 1
    number = max
    break if counter == 0
  end
  max
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
