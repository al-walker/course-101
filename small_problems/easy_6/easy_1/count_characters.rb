require 'pry'
require 'rubocop'

# Write a program that will ask a user for an input
# of a word or multiple words and give back the number of characters.
# Spaces should not be counted as a character.

# input
# word or multiple words (word)
#
# processes
# word.chars.count (letter_array)
#
# output
# number of characters (not counting spaces) (characters)

puts "Please write a word or multiple words."
word = gets.chomp

characters = word.chars.select { |l| l != ' ' }.count

puts "There are #{characters} characters in #{word}"

# Please write word or multiple words: walk

# There are 4 characters in "walk".
