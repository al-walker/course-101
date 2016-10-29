# Write a method that determines whether
# or not an array is palindromic; that is,
# the element values appear in the same sequence
# both forwards and backwards in the array.
# Now write a method that determines whether
# or not an array or a string is palindromic.
# You may not use an if, unless, or case statement or modifier.

# input
# array
#
# processes
# array.join == array.join.reverse
#
# output
# true or false

def palindrome?(array)
  array.join == array.join.reverse
end


letters = %w(M a d a m)
p palindrome?(letters)
