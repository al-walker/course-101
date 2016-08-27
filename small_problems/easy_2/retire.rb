puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i



puts "It's #{Time.now.year}. You will retire in #{Time.now.year + (retire_age - age)}."
puts "You have only #{retire_age - age} years of work to go!"
