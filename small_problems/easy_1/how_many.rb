require 'pry'

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(array)
  hash = array.inject(Hash.new(0)) do |total, vehicle|
    total[vehicle] += 1
    total
  end
  hash.each { |k, v| puts "#{k} => #{v}"}
end

count_occurrences(vehicles)

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
