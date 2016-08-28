require 'pry'

print "What is your name?"
name = gets.chomp
if name.chars.last == '!'
  p 'why are we screaming?'.upcase
else
  puts "Hello, #{name}."
#p match.to_s == name ? screaming : greet
end
