
def stringy(int)
  digits = []
  int.times do |d|
    d.even? ? d = '1' : d = '0'
    digits << d
  end
  digits.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
