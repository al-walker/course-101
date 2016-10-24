require 'pry'
require 'rubocop'

# Write a method that takes one argument, a positive integer,
# and returns the sum of its digits.

# input - positive integer
#
# processes
# -convert int to string
# -split the string into chars
# -convert each char into an integer
# -add the integers
#
# output - sum of positive integers digits

def sum(int)
  int.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
