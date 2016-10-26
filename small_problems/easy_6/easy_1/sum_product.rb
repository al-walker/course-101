require 'pry'
require 'rubocop'

# Write a program that asks the user to enter an
# integer greater than 0,
# then asks if the user wants to determine the sum or product
# of all numbers between 1 and the entered integer.

# input
# integer greater than 0
# processes
# ask for integer greater than 0
# prompt for sum or product
# compute sum or product of all numbers between 1 and entered integer
# output
# sum or product
#
# pseudocode
integer = 0
sum = 0
product = 0
operator = ''
numbers = []
counter = 1
puts ">> Please enter an integer greater than 0:"
integer = gets.chomp.to_i
# prompt for sum or pruduct with >> Enter 's' to compute the sum, 'p' to compute the product.
puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operator = gets.chomp
loop do
  numbers << counter
  break if counter == integer
  counter += 1
end
# The sum of the integers between 1 and 5 is 15.
if operator == 's'
  puts "The sum of the integers between 1 and #{integer} is #{numbers.reduce(:+)}."
else
  puts "The product of the integers between 1 and #{integer} is #{(1..integer).reduce(:*)}."
end

# tests
# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.
#
#
# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.
