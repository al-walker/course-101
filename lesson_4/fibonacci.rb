require 'pry'

numbers = [0, 1]
num = []
def fibonacci(array, new_array)
  array.each_with_index do |n, idx|
    if n == array[0] || n == array[1]
      new_array << n
    end
  end
  new_array << array[0] += array[1]
  new_array << (array[1] += array[1])
  counter = 3
  loop do
    new_array << (new_array[counter] + new_array[counter - 1])
    break if new_array.size == 20
    counter += 1
  end
end

fibonacci(numbers, num)
p num
