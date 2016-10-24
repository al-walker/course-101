require 'rubocop'

# Build a program that asks a user for the length and width
# of a room in meters and then displays the area of the room
# in both square meters and square feet.
#
# Note: 1 square meter == 10.7639 square feet
#
# Do not worry about validating the input at this time.

# input
# length
# width
#
# processes
# get length
# convert to integer
# get width
# convert to integer
# compute area in meters area_meters
# compute square feet area_feet = area_meters * 10.7639
#
# output
# display area in square meters and square feet

puts "Enter the length of the room in meters:"
length = gets.chomp.to_i

puts "Enter the width of the room in meters:"
width = gets.chomp.to_i

area_meters = length * width
area_feet = area_meters * 10.7639
puts "The area of the room is #{area_meters} square meters
     (#{area_feet} square feet)."
