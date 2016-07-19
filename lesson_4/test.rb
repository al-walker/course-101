# TTT Bonus feature 1

# def joinor(array, delimiter = ', ', last_delimiter = 'or')
#   if array.size == 2
#     p "#{array[0]} #{last_delimiter} #{array[1]}"
#   elsif array.size > 1
#     p "#{array[0...-1].join(delimiter)}#{delimiter}#{last_delimiter} #{array[-1]}"
#   else
#     p "#{array[0]}"
#   end
# end
#
# joinor([1, 2, 3])                # => "1, 2, or 3"
# joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
# joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
# joinor([1, 2])
# joinor([1])

# for study purposes to compare my solution
# def joinor(arr, delimiter=', ', word='or')
#   arr[-1] = "#{word} #{arr.last}" if arr.size > 1
#   arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
# end
# IMMEDIATE_THREAT.each do |line|
#   if brd.values_at(*line).count(PLAYER_MARKER) == 2
#
#   end
# end
# 21

#1. Initialize deck
deck = []
value = 0
suits = ['Hearts', 'Spades', 'Diamonds', 'Clubs']

def initialize_deck(deck, array, value)
  array.each do |suit|
    value = 2
    13.times do |card|
      if value == 2 || value == 3 || value == 4 || value == 5 || value == 6 || value == 7 || value == 8 || value == 9 || value == 10
        card = suit
        new_value = value
      elsif value == 11
         card = "Jack of #{suit}"
         new_value = 10
       elsif value == 12
         new_value = 10
         card = "Queen of #{suit}"
       elsif value == 13
         new_value = 10
         card = "King of #{suit}"
       else value == 14
         card = "Ace of #{suit}"
         new_value = [1, 11]
       end
       deck << [card, new_value]
       value += 1
     end
  end
end
initialize_deck(deck, suits, value)
#p deck.count
# 2. Deal cards to player and dealer
player_hand = []
player_hand = []
dealer_hand = []
def deal(deck, player_hand, dealer_hand)
  loop do
  puts "Hit or Stay"
  answer = gets.chomp.downcase
  break if answer == 'stay'
    if answer == 'hit'
    player_hand << deck.slice!(rand(1..52))
    end
  end
end

def dealer(deck, player_hand, dealer_hand)
  dealer_hand.each do |array|
    p array
   if v += v > 17
     puts "Hello"
   else v += v < 17
     dealer_hand << deck.slice!(rand(1..52))
   end
 #end
 end
end

def start_game(deck, player_hand, dealer_hand)
  2.times { player_hand << deck.slice!(rand(1..52)) }
  2.times { dealer_hand << deck.slice!(rand(1..52)) }
end

start_game(deck, player_hand, dealer_hand)
p player_hand
p dealer_hand
p dealer_hand[0]
deal(deck, player_hand, dealer_hand)
#dealer(deck, player_hand, dealer_hand)
p dealer_hand
p dealer_hand.count
p player_hand.count
p deck.count
#3. Player turn: hit or stay
  # - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
  # - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.
