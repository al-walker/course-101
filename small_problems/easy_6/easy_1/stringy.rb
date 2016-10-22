require 'pry'
require 'rubocop'

# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

# given an integer
# return string of 1s and 0s length == integer
# int times do "1010"
# start with 1

def stringy(int)
  strings = []
  counter = 0
  binary = '1'
  loop do
    strings << binary
    binary = binary == '1' ? '0' : '1'
    counter += 1
    break if counter == int
  end
  strings.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
