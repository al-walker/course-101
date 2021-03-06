# Question 1

# When you initialize a local variable within an if block, the local variable is initialized to nil. - No exception is thrown.

if false
  greeting = “hello world”
end

p greeting

# Question 2

# {:a => "hi there"}
# informal_greeting is areference to the original object.
# informal_greeting << ' there' uses String#<< which modifies the object that called it. This means the original object was changed, therby impacting the value in greetings.

# if we only wanted to modify informal_greeting, we could initialize it with a reference to a new object. greetings[:a].clone
# We could also use string concatenation which returns a new String object instead of modifying the original object. informal_greeting = informal_greeting + ' there'

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# Question 3

# A)
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # "one"
puts "two is: #{two}" # "two"
puts "three is: #{three}" # "three"

# B)
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # "one"
puts "two is: #{two}" # "two"
puts "three is: #{three}" # "three"

# C)
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # "two"
puts "two is: #{two}" # "three"
puts "three is: #{three}" # "one"

# Question 4

require "securerandom"

def create_uuid
  SecureRandom.uuid
end

p create_uuid

# or

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

p generate_UUID

# Question 5

# I needed to create an is_a_number? method.

def is_a_number?(word)
  Integer(word) rescue false
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false if !is_a_number?(word)
  end
  true
end

p dot_separated_ip_address?('a.c.b.e')
p dot_separated_ip_address?('10.4.5.11')
p dot_separated_ip_address?('10.4.5')
