def room_size(length, width)
  length * width
end

puts "Enter the length of the room in meters."
room_length = gets.chomp.to_f
puts "Enter the width of the room in meters."
room_width = gets.chomp.to_f

meters = room_size(room_length, room_width)
square_feet = meters * 10.7639
puts "The area of the room is #{meters} square meters (#{square_feet} square feet)."
