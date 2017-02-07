# input: two arrays passed in as arguments to a method
# output: new array all elements alternating
# algrithm: .map.zip

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) # == [1, 'a', 2, 'b', 3, 'c']
