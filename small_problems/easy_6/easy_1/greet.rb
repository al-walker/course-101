# Write a program that will ask for user's name.
# The program will then greet the user.
# If the user writes "name!"
# then the computer yells back to the user.

# input
# name
# processes
# get username with What is your name?
# greet the user by name
# if ! yell back at the user
# output
# Hello Bob.
# or
# HELLO BOB. WHY ARE WE SCREAMING?

# pseudocode

puts "What is your name?"
name = gets.chomp

if name.chars.last == '!'
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

# What is your name? Bob
# Hello Bob.
#
# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?
