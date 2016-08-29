puts "Enter a number."
number = gets.chomp.to_i

puts "Enter 's' to calculate the sum or 'p' to calculate the product."
choice = gets.chomp.downcase

if choice == 's'
  puts "The sum of the integers between 1 and #{number} is
   #{(1..number).reduce(:+)}"
else
  puts "The product of the integers between 1 and #{number} is
   #{(1..number).reduce(:*)}"
end
