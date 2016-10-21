require 'pry'
require 'rubocop'
=begin

Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.


create constant for vowels
create an array to hold string with no vowels
=end

VOWELS = %w(a e i o u A E I O U)

def remove_vowels(array_of_strings)
  no_vowels = []
  array_of_strings.to_s.chars.select { |l| no_vowels << l unless VOWELS.include?(l) }
  no_vowels.join
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) # == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) # == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) # == ['BC', '', 'XYZ']
