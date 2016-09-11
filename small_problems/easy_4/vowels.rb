words = %w(green yellow black white)

def remove_vowels!(array)
  array.each { |w| w.delete! 'aeiou' }
end

p remove_vowels!(words)
