require 'pry'
require 'rubocop'

# Write a program that solicits 6 numbers from the user,
# then prints a message that describes whether or not
# the 6th number appears amongs the first 5 numbers.

# input
# get 6 numbers from the user
#
# processes
# get number 6 times
# add each number to an array
# check if 6th number is already in the array
#
# output
# print message that states whether the 6th number appears in the first 5

numbers = []
counter = 0
number_id = %w(1st 2nd 3rd 4th 5th)

5.times do
  puts "Enter the #{number_id[counter]} number."
  numbers << gets.chomp.to_i
  counter += 1
end

puts "Enter last number."
last_number = gets.chomp.to_i

if numbers.include?(last_number)
  puts "The number #{last_number} appears in #{numbers}."
else
  puts "The number #{last_number} does not appear in #{numbers}."
end
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].
