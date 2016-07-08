# Question 1
# 10.times { |number| puts number }

10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# Question 2

statement = "The Flintstones Rock"

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a

letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

p result

# Question 3
# puts "the value of 40 + 2 is " + (40 + 2)
# an integer is being concatenated to a string
puts "the value of 40 + 2 is #{40 + 2}"
# fix by using string interpolation.
# or
puts "the value of 40 + 2 is " + (40+2).to_s
# call to_s to convert the integer to a string

# Question 4

# 1, 3
# 1, 2
