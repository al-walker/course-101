require 'pry'


def century(year)
  century = []
  year.to_s.chars.each_with_index do |c, idx|
    if idx == 0 || idx == 1
      century << c
    end
  end
  century.join + 'th'
end



p century(2000) # == '20th'
# century(2001) # == '21st'
# century(1965) # == '20th'
# century(256) # == '3rd'
# century(5) # == '1st'
# century(10103) # == '102nd'
# century(1052) # == '11th'
# century(1127) # == '12th'
# century(11201) # == '113th'
