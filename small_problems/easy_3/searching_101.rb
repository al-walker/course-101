numbers = []

5.times do
  puts "Enter a number."
  numbers << gets.chomp
end

puts "Enter a number."
number = gets.chomp

if numbers.include?(number)
  puts "#{number} is in #{numbers}."
else
  puts "#{number} is not in #{numbers}."
end
