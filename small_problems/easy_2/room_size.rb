def room_size(length, width)
  length * width
end

puts "Enter the length of the room in meters."
room_length = gets.chomp.to_i
puts "Enter the width of the room in meters."
room_width = gets.chomp.to_i

p room_size(room_length, room_width)
