require 'pry'
require 'rubocop'

def sum(integer)
  integer.to_s.split('').map(&:to_i).reduce(:+)

  # Revised solution
  # str = integer.to_s.split('')
  # str.map(&:to_i).reduce(:+)

  # first solution
  # sum = 0
  # integer.to_s.split('').each { |n| sum += n.to_i }
  # sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
