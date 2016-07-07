# Question 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.include?("Spot")
p ages.has_key?("Spot")
p ages.key?("Spot")
p ages.member?("Spot")

# Question 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.inject(:+)

total_age = 0
ages.each do |k, v|
  total_age += v
end

p total_age

# Question 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.reject! { |k, v| v > 100 }
p ages

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.keep_if { |_, age| age < 100 }

# Question 4

munsters_description = "The Munsters are creepy in a good way."

p munsters_description
p munsters_description.swapcase
p munsters_description.downcase
p munsters_description.upcase
# "The munsters are creepy in a good way."
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

# Question 5

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

p ages.merge!(additional_ages)

# Question 6

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.min
# or
minimum = ages.values.max
ages.each do |_, v|
  if v < minimum
    minimum = v
  end
end
p minimum

# Question 7

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.include?('Dino')
# or
p advice.match("dino")

# Question 8

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.index { |name| name.start_with?('Be') }
# or
p flintstones.index { |name| name[0, 2] == "Be" }

# Question 9

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.map! { |name| name[0..2] }

# Question 10

p flintstones.map! { |name| name[0,3] }
