require 'pry'
require 'rubocop'

# Write a method that returns true if the
# string passed as an argument is a palindrome,
# false otherwise.
# (A palindrome reads the same forwards and backwards.)
# Case matters, and all characters should be considered.

# input
# string
#
# processes
# use reverse
# or
# chars into array in reverse order
# compare string and reverse string
#
# output
# true or false

def palindrome?(str)
  str == str.reverse
end

p palindrome?('madam') # == true
p palindrome?('Madam') # == false          # (case matters)
p palindrome?("madam i'm adam") # == false # (all characters matter)
p palindrome?('356653') # == true
