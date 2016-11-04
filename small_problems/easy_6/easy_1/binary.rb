require 'pry'
require 'rubocop'

# input
# binary number
#
# processes
# check value of each binary digit
# split the binary number
# multiply binary digit by its value
# add each number in the array to poduce the decimal
#
# output
# decimal number

def binary_to_decimal(binary)
  values = [8, 4, 2, 1]
  counter = 0
  decimal = []
  decimal_number = 0
  binary.to_s.chars.each do |n|
    decimal_number = n.to_i * values[counter]
    decimal << decimal_number
    counter += 1
  end
  decimal.reduce(:+)
end

p binary_to_decimal(1111)
p binary_to_decimal(1011)
