
def stringy(int, start = 1)
  digits = []
  int.times do |d|
    digits << if start == 1
                d.even? ? '1' : '0'
              else
                d.even? ? '0' : '1'
              end
  end
  digits.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(2, 0)
puts stringy(4, 0)
