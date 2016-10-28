require 'pry'
require 'rubocop'

# Using the multiply method from the
# "Multiplying Two Numbers" problem,
# write a method that computes the square of its argument
# (the square is the result of multiplying a number by itself).

# input
# number
#
# processes
# multiply the given number by itself
#
# ouput
#  square of number
def multiply(number_1, number_2)
  number_1 * number_2
end

def square(number)
  number_1 = number
  number_2 = number
  multiply(number_1, number_2)
end

p square(5) # == 25
p square(-8) # == 64
