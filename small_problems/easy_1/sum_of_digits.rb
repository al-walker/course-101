require 'pry'

def sum(integer)
  sum = 0
  integer.to_s.split('').each do |n|
    sum += n.to_i
  end
  sum
end


puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
