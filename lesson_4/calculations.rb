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
quantity = []
item_prices = []

number = 1
loop do
  break if number == 4
  puts "Enter the price of item #{number}: "
  item_prices << gets.chomp.to_i
  puts "Enter the quantity of item #{number}: "
  quantity << gets.chomp.to_i
  number += 1
end

subtotal = (item_prices[0] * quantity[0]) + (item_prices[1] * quantity[1]) + (item_prices[2] * quantity[2])

puts "Subtotal: $#{sprintf('%.2f', subtotal)}"
puts "Tax: $#{sprintf('%.2f', subtotal * TAX)}"
total = subtotal + (subtotal * TAX)
puts "Total: $#{sprintf('%.2f', total)}"
