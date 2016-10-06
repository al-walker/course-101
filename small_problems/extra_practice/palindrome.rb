require 'rubocop'
require 'pry'

def palindrome?(word)
  idx = 0
  match = []
  letters = []
  letters = word.scan(/\w+/).join.downcase
  return false if letters.size <= 1
  loop do
    if letters[idx] == letters[-1 - idx]
      break if idx == letters.size
      match << true
      idx += 1
    else
      return false
    end
  end
  letters.size == match.size
end

p palindrome?("madam i'm adam")
