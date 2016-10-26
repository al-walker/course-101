# require 'pry'
# require 'rubocop'
#
# # Print all odd numbers from 1 to 99, inclusive.
# # All numbers should be printed on separate lines.
#
# input
# range 1..99
#
# processes
# select odd numbers
# print odd numbers on separate lines
# output
# odd numbers on separate lines
#
# pseudocode
odd = []
(1..99).map { |n| odd << n if n.odd? }
odd.each { |n| p n }
# iterate through
# check if each number is odd
# collect odd numbers into new array
# loop through new array and print all the numbers
#
# tests
# 1
# 3
# 5
# 7
# 9
# 11
