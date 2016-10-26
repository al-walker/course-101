# Build a program that displays when the user will retire
# and how many years she has to work till retirement.

# input
# current age
# age = 0
# current date
# current_year = Date.new
# age would like to retire
# retirement_age = 0
#
# processes
# calculate years until retirement
# retirement_age - current_age
# current_year = 2016
# calculate retirement year
# retirement_year = (retirment_age - current_age) + current_year
#
# output
# current year
# year user will retire
# years until retirement

def retirement_calculator(current_year)
  puts "What is your age?"
  current_age = gets.chomp.to_i

  puts "At what age would you like to retire?"
  retirement_age = gets.chomp.to_i

  retirement_year = (retirement_age - current_age) + current_year.to_i

  puts "It's #{current_year}. You will retire in #{retirement_year}."
  puts "You have only #{retirement_year - current_year} years of work to go!"

end

retirement_calculator(2016)
# What is your age? 30
# At what age would you like to retire? 70
#
# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!
