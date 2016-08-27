puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i

puts "It's #{Time.now.year}.
You will retire in #{Time.now.year + (retire_age - age)}."
puts "You have only #{retire_age - age} years of work to go!"

# print 'What is your age? '
# current_age = gets.to_i
#
# print 'At what age would you like to retire? '
# retirement_age = gets.to_i
#
# current_year = Time.now.year
# work_years_to_go = retirement_age - current_age
# retirement_year = current_year + work_years_to_go
#
# puts "It's #{current_year}. You will retire in #{retirement_year}. "
# puts  "You have only #{work_years_to_go} years of work to go!"
