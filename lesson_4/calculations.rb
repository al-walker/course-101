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
