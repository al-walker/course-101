require 'pry'

def oddities(list)
  odd = []
  list.each_with_index do |item, idx|
    odd << item if idx == 0 || idx.even?
  end
  odd
end

def even_idx(list)
  even = []
  list.each_with_index do |item, idx|
    even << item unless idx == 0 || idx.odd?
  end
  even
end

# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []

# p even_idx([2, 3, 4, 5, 6]) == [2, 4, 6]
# p even_idx(['abc', 'def']) == ['abc']
# p even_idx([123]) == [123]
# p even_idx([]) == []

p even_idx([2, 3, 4, 5, 6]) == [4, 6]
p even_idx(['abc', 'def']) == []
p even_idx([123]) == []
p even_idx(['abc', 'def', 'ghi']) == ['ghi']
p even_idx([]) == []
