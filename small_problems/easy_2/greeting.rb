require 'pry'

print "What is your name?"
name = gets.chomp

if name.scan /\w+!/
puts 'why are we screaming?'.upcase
else
puts "Hello, #{name}."
end
