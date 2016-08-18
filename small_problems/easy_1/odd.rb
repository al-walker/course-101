def is_odd?(number)
  number % 2 != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true - odd
puts is_odd?(-17)  # => true - odd
puts is_odd?(-8)   # => false
puts is_odd?(7.1)  # => true - odd
puts is_odd?(-5.0) # => true - odd
