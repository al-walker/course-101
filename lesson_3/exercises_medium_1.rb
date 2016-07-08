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

# Question 5

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

# Bonus 1
# The % operator returns a remainder - if no remainder, evenly divisible

# Bonus 2
# Last statement in a method is implicitly returned

# Question 6

# In rolling_buffer1, the input argument called buffer will be modified.
# rolling_buffer2 will not modify the input argument called input_array.

# Question 7

# fib is a method and does not have access to local variables outside of its scope.
# define limit within the method or set limit as an additional argument.

def fib(first_num, second_num)
  limit = 15
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# or

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"

# Question 8

words = "this is a title"
p words.split.map { |word| word.capitalize }.join(' ')
# or
def titleize!(title)
  title.split.each { |word| word.capitalize! }.join(' ')
end

p titleize!("this is the title test")

# Question 9

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  case details["age"]
  when 0..18
    details["age_group"] = "kid"
  when 18..65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

p munsters
