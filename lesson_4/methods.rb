score = 0
letter = 'a'

def increment_score(num)
  num += 1
end

def change_letter(l)
  l = 'b'
end

new_score = increment_score(score)
p increment_score(score)
p score
p new_score

puts "The score is #{score}"
puts "The score is #{increment_score(score)}"

new_letter = change_letter(letter)
p change_letter(letter)
p letter
p new_letter
