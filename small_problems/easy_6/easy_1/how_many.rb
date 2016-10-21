require 'rubocop'

# Write a method that counts the number of occurrences of each element in a given array.

# Create hash to store vehicle and count
# loop through vehicles
# add element => number of occurences
# print hash

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(array)
  element_hash = {}
  array.each do |e|
    element_hash[e] = array.count(e)
  end
  element_hash
end

p count_occurrences(vehicles)

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
