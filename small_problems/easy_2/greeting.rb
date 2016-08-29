require 'pry'

print "What is your name?"
name = gets.chomp

# if name.chars.last == '!'
#   p 'why are we screaming?'.upcase
# else
#   puts "Hello, #{name}."
# end

# p name.chars.last == '!' ? 'WHY ARE WE SCREAMING?' : "Hello, #{name}."

match = name.scan(/!/)
p name.chars.last == match.pop ? "HELLO, #{name} WHY ARE WE SCREAMING?" : "Hello, #{name}."
