words = ['green', 'yellow', 'black', 'white']

def remove_vowels!(array)
  array.each do |w|
    w.delete! 'aeiou'
  end
end

p remove_vowels!(words)
