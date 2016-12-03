# input
# array
# output
# new array with element reversed

# algorithm
# map elements to new array
# << elements to end of array
# descening index starting with next to last element

# pseudocode
new_array = []
def reverse(array)
  counter = array.size - 1
  array.map do |n|
    new_array << n if n == array[counter]
  end
  new_array << array[array.size]
end
# tests
p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
list.object_id != new_list.object_id  # => true
list == [1, 2, 3]                     # => true
new_list == [3, 2, 1]                 # => true
