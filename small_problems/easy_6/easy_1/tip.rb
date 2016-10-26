require 'pry'
require 'rubocop'

# Create a simple tip calculator.
# The program should prompt for a bill amount and a tip rate.
# The program must compute the tip and
# then display both the tip and the total amount of the bill.

# input
# bill amount
# tip rate
# tip
# total
#
# processes
# prompt for bill amount
# prompt for tip rate
# compute tip
# compute total + tip
#
# output
# display total amount

# bill_amount = 0.0
# tip_rate = 0.0
# total_amount = 0.0
# tip = 0.0

def tip_calculator
  puts "What is the bill?"
  bill_amount = gets.chomp.to_f

  puts "What is the tip percentage?"
  tip_rate = gets.chomp.to_f / 100

  tip = bill_amount * tip_rate

  total_amount = bill_amount + tip
  puts "The tip is $#{tip}"
  puts "The total is #{total_amount}"
end

tip_calculator
# What is the bill? 200
# What is the tip percentage? 15
#
# The tip is $30.0
# The total is $230.0
