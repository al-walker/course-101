puts "What is the bill?"
bill = gets.chomp.to_i
puts "What is the tip percentage?"
percentage = gets.chomp.to_f

total = bill * percentage

puts "The tip is #{}"
puts "The total is #{total}"
