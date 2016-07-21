require 'pry'

player_hand = []
dealer_hand = []

# Initialize Deck
cards =
[['H', '2'], ['H', '3'],['H', '4'],['H', '5'],['H', '6'],
['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'],
['H', 'Q'], ['H', 'K'], ['H', 'A'], ['S', '2'], ['S', '3'],
['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'],
['S', '10'], ['S', 'J'], ['S', 'Q'], ['S', 'K'], ['S', 'A'],
['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'],
['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'],
['D', 'K'], ['D', 'A'], ['C', '2'], ['C', '3'], ['C', '4'],
['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '10'],
['C', 'J'], ['C', 'Q'], ['C', 'K'], ['C', 'A']]

# Deal cards to player and dealer

def start_game(cards, player_hand, dealer_hand)
  2.times { player_hand << cards.slice!(rand(0..cards.size)) }
  2.times { dealer_hand << cards.slice!(rand(0..cards.size)) }
end

def total(hand)
  # cards = [['H', '3'], ['H', '2']
  values = hand.map { |card| card[1] }

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

def busted?(hand)
  total(hand) > 21
end

# Player turn: hit or stay
# - repeat until bust or "stay"
def player_turn(cards, player_hand)
  puts "#{player_hand}"
  answer = nil
  loop do
    puts "hit or stay?"
    answer = gets.chomp
    player_hand << cards.slice!(rand(0..cards.size))
    break if answer == 'stay' || busted?(player_hand)
  end

  if busted?(player_hand)
    #puts "Play again? y or n"
    #play_again = gets.chomp.downcase
    #break if play_again == 'n'
    puts "Game over"
    # end game or ask to play again
  else
    puts "You chose to stay!"
  end
end
# continue to dealer turn

def dealer_turn(cards, dealer_hand)
  answer = nil
  loop do
    puts "hit or stay?"
    if total(dealer_hand) >= 17
      answer = 'stay'
    else
      answer = 'hit'
      dealer_hand << cards.slice!(rand(0..cards.size))
    end
    break if answer == 'stay' || busted?(dealer_hand)
  end

  if busted?(dealer_hand)
    puts "Play again? y or n"
    play_again = gets.chomp.downcase
    # break if play_again == 'n'

    # end game or ask to play again
  else
    puts "You chose to stay!"
  end
end

loop do
  puts "play again?"
  play_again = gets.chomp
  break if play_again == 'n'
  start_game(cards, player_hand, dealer_hand)
  player_turn(cards, player_hand)
  dealer_turn(cards, dealer_hand)
end
