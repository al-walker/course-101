require 'pry'
require 'rubocop'

def reverse_words(words)
  reversed = []
  words.split.each do |w|
    if w.length >= 5
      w.reverse!
    end
    reversed << w
  end
  reversed.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
