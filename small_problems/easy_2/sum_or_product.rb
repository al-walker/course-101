puts "Enter a number."
number = gets.chomp.to_i

puts "Enter 's' to calculate the sum or 'p' to calculate the product."
choice = gets.chomp.downcase

if choice == 's'
  p (1..number).reduce(:+)
else
  p (1..number).reduce(:*)
end
