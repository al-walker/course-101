require 'pry'

def palindrome?(string)
  reverse = []
  string.chars.each_with_index do |l, idx|
    reverse << l if l == string.reverse[idx]
  end
  reverse.join == string
end



p palindrome?('madam') # == true
p palindrome?('Madam') # == false          # (case matters)
p palindrome?("madam i'm adam") # == false # (all characters matter)
p palindrome?('356653') # == true
