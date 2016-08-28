require 'pry'

print "What is your name?"
name = gets.chomp

# if name.chars.last == '!'
#   p 'why are we screaming?'.upcase
# else
#   puts "Hello, #{name}."
# end

p name.chars.last == '!' ? 'why are we screaming?'.upcase : "Hello, #{name}."
