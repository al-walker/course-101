def calculate_bonus(amount, goal)
  goal ? amount / 2 : 0
end


puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
