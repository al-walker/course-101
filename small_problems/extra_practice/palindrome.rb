require 'rubocop'

def palindrome?(word)
  idx = 0
  match = []
  letters = []
  letters = word.scan(/\w+/).join.downcase
  return false if letters.size <= 1
  loop do
    if letters[idx] == letters[-1 - idx]
      match << true
      break if idx == letters.size
      idx += 1
    else
      return false
    end
  end
  letters.size == match.size - 1
end

p palindrome?("  ")
