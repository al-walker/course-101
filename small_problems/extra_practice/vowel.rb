require 'pry'

words = %w(one two three)

def remove_vowels(str)
  vowels = %w(a e i o u)
  new = []
  str.each do |w|
    new << w.chars.select { |letter| !vowels.include?(letter) }
  end
  new.each { |no_vowel| p no_vowel.join }
end

remove_vowels(words)
