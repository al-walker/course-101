require 'rubocop'

=begin
Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word is swapped.

You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

1. Given a string of words separated by spaces
2. iterate through and swap 1st and last letters of each word
   - split string into an array of words
   - access first and last character by index
   - use parallel assignment to swap the values.
=end

def swap(str)
  str.split.each do |word|
    word[0], word[-1] = word[-1], word[0]
  end
end

p swap('Oh what a wonderful day it is') # == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') # == 'ebcdA'
p swap('a') # == 'a'
