require 'pry'

# def palindrome?(string)
#   string == string.reverse
# end

def palindrome?(string)
  array = string.chars
  string.chars == array.reverse
end

# def palindrome?(string)
#   array = string.chars
#   reverse = []
#   array.each_with_index do |l, idx|
#     reverse << l if l == string.reverse[idx]
#   end
#   reverse == array
# end

p palindrome?('madam') # == true
p palindrome?('Madam') # == false          # (case matters)
p palindrome?("madam i'm adam") # == false # (all characters matter)
p palindrome?('356653') # == true

# p palindrome?('madam') # == true
# p palindrome?('Madam') # == false          # (case matters)
# p palindrome?("madam i'm adam") # == false # (all characters matter)
# p palindrome?('356653') # == true
