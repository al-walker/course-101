# require 'pry'
#
# puts "What is the bill?"
# bill = gets.chomp.to_f
#
# puts "What is the tip percentage?"
# percentage = gets.chomp.to_f
#
# tip = (bill * (percentage / 100)).round(2)
# total = (tip + bill).round(2)
#
# puts "The tip is $#{tip}"
# puts "The total is $#{total}"

puts 'What is the bill?'
bill = gets.chomp.to_i

convert = '.01'

puts 'What is the tip percentage?'
percentage = gets.chomp.to_i
multiplier = convert.to_f
tip = bill * percentage * multiplier

puts "The tip is $#{tip}"
puts "The total is $#{bill + tip}"
