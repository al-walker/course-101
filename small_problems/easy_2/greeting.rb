require 'pry'

print "What is your name?"
name = gets.chomp

match = name.scan /\w+!/

if match
  p 'why are we screaming?'.upcase
  else
  puts "Hello, #{name}."
  end
