=begin
Given a string that consists of some words and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

1. iterate through string
   - Create a new empty array to hold spaces or characters.
2. replace non-alphabetic characters with spaces
3. no consecutive spaces
   - remove consecutive spaces with squeeze
4. return new string
=end

def cleanup(str)
  new_string = []
  characters = ['-', "'", '+', '*', '&', '?']
  str.chars.each do |c|
    if characters.include?(c)
      new_string << ' '
    else
      new_string << c
    end
  end
  new_string.join.squeeze
end

p cleanup("---what's my +*& line?") # == ' what s my line '
