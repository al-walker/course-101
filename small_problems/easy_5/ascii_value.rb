require 'pry'

def ascii_value(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end

p ascii_value('four score') == 984 # possible error in question
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
