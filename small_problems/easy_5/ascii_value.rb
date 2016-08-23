require 'pry'

def ascii_value(string)
  ascii = []
  string.chars.each do |s|
    if s == " "
      ascii << 0
    else
      ascii << s.ord
    end
  end

  ascii.reduce(:+)
end

p ascii_value('four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
