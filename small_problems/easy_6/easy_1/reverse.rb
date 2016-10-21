require 'pry'
require 'rubocop'
#Write a method that takes one argument, a string, and returns the same string with the words in reverse order.

# given a string
# reverse the words
# return the same string in reverse order

def reverse_sentence(sentence)
  sentence.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
