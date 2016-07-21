deck =
[['H', '2'], ['H', '3'],['H', '4'],['H', '5'],['H', '6'],
['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'],
['H', 'Q'], ['H', 'K'], ['H', 'A'],
['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6'],
['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'J'],
['S', 'Q'], ['S', 'K'], ['S', 'A']['D', '2'], ['D', '3'],
['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'], ['D', '8'],
['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'],
['D', 'K'], ['D', 'A'], ['C', '2'], ['C', '3'],
['C', '4'], ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '10'],
['C', 'J'], ['C', 'Q'], ['C', 'K'],
['C', 'A']]

def total(cards)
  # cards = [['H', '3'], ['H', '2']
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A"}.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

answer = nil
loop do
  puts "hit or stay?"
  answer = gets.chomp
  break if answer == 'stay' || busted?
end

if busted?
  # end game or ask to play again
else
  puts "You chose to stay!"
end

# continue to dealer turn
