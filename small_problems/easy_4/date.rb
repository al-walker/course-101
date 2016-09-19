require 'date'

def fridays?(year)
  jan = Date.new(year, 1, 1)
  dec = Date.new(year, 12, 31)
  (jan..dec).each do |day|
    if day.friday?
      p day
    end
  end
end

fridays?(2016)
