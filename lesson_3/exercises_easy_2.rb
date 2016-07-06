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
