require 'pry'
require 'rubocop'
#Write a method that takes one argument, a string containing one or more words, and returns the given string with all five or more letter words reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

# given a string
# reverse all 5 or more letter words
#  - split into letters
#  - reverse all letters
#  - join letters
# return reversed words

def reverse_words(str)
  new_words = []
  str.split(' ').each do |s|
    s.length >= 5 ? new_words << s.chars.reverse.join : new_words << s
  end
  new_words.join(' ')
end


puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
