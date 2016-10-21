=begin
inititalize a str
inititalize an int
loop print str int times
=end

def repeat(str, int)
  int.times { p str }
end

puts "Enter a string."
response = gets.chomp

puts "Enter an integer."
number = gets.chomp.to_i

repeat(response, number)
