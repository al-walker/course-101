require 'pry'

# Area of a rectangle

length = 2
width = 4
square_feet = length * width
square_meters = square_feet * 0.09290304
puts "#{square_feet} square feet"
puts "#{square_meters} square meters"

# Division with remainders

# Pizza example

slices = 8
people = 3

puts "#{people} people sharing #{slices} slices."
puts "Each person gets #{slices / people} slices"
if slices % people != 0
  puts "There are #{slices % people} slices left over."
end

# Paint calculator

length_of_room = 17
width_of_room = 70

square_feet = length_of_room * width_of_room
gallon = 350

puts "You will need to purchase #{(square_feet.to_f / gallon.to_f).ceil}"
puts "gallons of paint ot cover #{square_feet} square_feet."

# Self-checkout

TAX = 0.055
item_one = 10
item_two = 10
item_three = 10

quantity = [1, 2, 3]

subtotal = (item_one * quantity[0]) + (item_two * quantity[1]) + (item_three * quantity[2])

puts "Subtotal: #{subtotal}"
puts "Tax: #{subtotal * TAX}"
puts "Total: #{subtotal + (subtotal * TAX)}"
