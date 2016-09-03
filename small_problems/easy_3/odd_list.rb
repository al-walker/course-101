require 'pry'

def oddities(list)
  odd = []
  list.each_with_index do |item, idx|
    odd << item if idx == 0 || idx.even?
  end
  odd
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
