require 'pry'

words = gets.chomp
count = 0
words.chars do |letter|

    unless letter == ' '
      count += 1
    end

  end
puts "There are #{count} letters in #{words}."
