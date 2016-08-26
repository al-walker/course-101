puts "What is the bill?"
bill = gets.chomp.to_i
puts "What is the tip percentage?"
percentage = gets.chomp.to_f

tip = bill * percentage
total = tip + bill

puts "The tip is #{tip}"
puts "The total is #{total}"
