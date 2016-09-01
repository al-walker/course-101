require 'pry'

puts "Enter a word or words."
words = gets.chomp
count = 0
words.chars do |letter|
  count += 1 unless letter == ' '
end

puts "There are #{count} letters in \"#{words}\"."
