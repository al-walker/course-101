# Question 1
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# It prints out 1, 2, 3, 4 as strings (puts calls to_s on its argument)
# numbers.uniq returns a new Array object with unique elements. It does not modify the array (.uniq! is the destructive version)

# Question 2
# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:
# ! Not
# ? : ternary operator for if...else

# what is != and where should you use it?
# Not equals - conditional expression

# put ! before something, like !user_name
# turn any object to the opposite of its boolean equivalent.

# put ! after something, like words.uniq!
# may signal the method is destructive - Mutates the caller
# part of the method name - depends on implementation

# put ? before something
# ternary operator

# put ? after something
# part of the method name

# put !! before something, like !!user_name
# turn any object into its boolean equivalent

#Question 3 - Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!('important', 'urgent')

p advice

# Question 4

numbers = [1, 2, 3, 4, 5]
p numbers.delete_at(1) # deletes 2

numbers = [1, 2, 3, 4, 5]
p numbers.delete(1) # deletes 1

# Question 5

p (10..100).include?(42)

# Question 6

famous_words = "seven years ago..."
p famous_words.prepend("Four score and ")

famous_words = "seven years ago..."
p "Four score and " + famous_words

# Question 7

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
p eval(how_deep)

# Question 8

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
p flintstones << ["BamBam", "Pebbles"]
p flintstones.flatten!

# Question 9

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p flintstones.to_a[2]

# Question 10

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
p Hash[flintstones.map.with_index { |name, idx| [idx, name] }]
# or
new_hash = Hash[(0...flintstones.size).zip flintstones]
p new_hash
# or
flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end
# I initially tried each_with_index, but when I started to look up details, I found the first two.  I put them here for future reference. (when I fully understand how they work)
