require 'pry'

numbers = [0, 1]
sequence = []
def fibonacci(array, new_array)
  array.each do |n|
    new_array << n
  end
  new_array << array[0] += array[1]
  new_array << array[1] += array[1]
  counter = 3
  loop do
    new_array << new_array[counter] + new_array[counter - 1]
    break if new_array.size == 20
    counter += 1
  end
end

fibonacci(numbers, sequence)
p sequence
