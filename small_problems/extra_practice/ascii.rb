require 'pry'
require 'rubocop'
=begin
Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

1- Set a String variable with a passed in argument
2- Determine the ascii value of each character - Use .ord
  - iterate through each character
  - add the ascii value to an array
3- return the sum of the values in the array
=end

def ascii_value(str)
  ascii_values = []
  str.chars.each do |l|
    ascii_values << l.ord
  end
  ascii_values != [] ? ascii_values.reduce(:+) : 0
end

p ascii_value('Four score') # == 984
p ascii_value('Launch School') # == 1251
p ascii_value('a') # == 97
p ascii_value('') # == 0
