require 'pry'
require 'rubocop'
require 'pry-nav'
# Write a method that can rotate the last n digits of a number.

# input
# integer
# processes
# rotate last n digits
# digit at n to end
# output
# return new integer with digit at n at end

def rotate_rightmost_digits(number, rotation_digit)
  new_number = [] # hold new digit order; join; to_i
  counter = 0 # loop through digits as array of strings
  loop do
    # loop through number add all but string at rotation_digit (as number from end)
    unless number.to_s.chars[-rotation_digit].to_i == number.to_s.chars[counter].to_i
      new_number << number.to_s.chars[counter].to_i
    end
    counter += 1
    break if new_number.size == number.to_s.chars.size - 1
  end
  number.to_s.chars.select { |n| new_number << n.to_i if n == number.to_s.chars[-rotation_digit] }
  new_number.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
