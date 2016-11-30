# input
# number of digits
# output
# returns the index
# of the 1st number with that many digits

# Algorithm (array)
# given number of digits
# calculate up to 1st fibonacci number with given number of digits
# select that number and return

# pseudocode
# convert each fibonacci number into an array of strings
# select the index of the first array of the given size
def fib
  fib_array = [1, 1]
  counter = 0
  loop do
    fib_array << fib_array[counter] + fib_array[counter + 1]
    counter += 1
    break if counter == 10_000
  end
  fib_array
end

# fibonacci_array = fib

def find_fibonacci_index_by_length(length)
  fibonacci_array = fib
  fibonacci_array.each_with_index do |n, idx|
    return idx + 1 if n.to_s.chars.size == length
    break if n.to_s.chars.size == length
  end
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847
