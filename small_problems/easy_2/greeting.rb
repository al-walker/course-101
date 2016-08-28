require 'pry'

print "What is your name?"
name = gets.chomp

# if name.chars.last == '!'
#   p 'why are we screaming?'.upcase
# else
#   puts "Hello, #{name}."
# end
match = name.scan /!/
# p name.chars.last == '!' ? 'why are we screaming?'.upcase : "Hello, #{name}."
p name.chars.last == match.pop ? 'why are we screaming?'.upcase : "Hello, #{name}."
