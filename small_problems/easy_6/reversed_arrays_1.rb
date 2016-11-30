require 'pry'
require 'pry-nav'
# input
# array
# output
# reversed array in place

# pseudocode
# given an array
# loop
# slice! elements
# << to end of array
# end
def reverse!(array)
  counter = array.size - 1
  loop do
    array << array.slice!(counter)
    counter -= 1
    break if counter < 0
  end
  array
end

# tests
list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
list == [4, 3, 2, 1]
p list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
reverse!([]) # => []
p list == []
