require 'pry'
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

deck =
[["Hearts", 2],
["Hearts", 3],
["Hearts", 4],
["Hearts", 5],
["Hearts", 6],
["Hearts", 7],
["Hearts", 8],
["Hearts", 9],
["Hearts", 10],
["Jack of Hearts", 10],
["Queen of Hearts", 10],
["King of Hearts", 10],
["Ace of Hearts", [1, 11]],
["Spades", 2],
["Spades", 3],
["Spades", 4],
["Spades", 5],
["Spades", 6],
["Spades", 7],
["Spades", 8],
["Spades", 9],
["Spades", 10],
["Jack of Spades", 10],
["Queen of Spades", 10],
["King of Spades", 10],
["Diamonds", 2],
["Diamonds", 3],
["Diamonds", 4],
["Diamonds", 5],
["Diamonds", 6],
["Diamonds", 7],
["Diamonds", 8],
["Diamonds", 9],
["Diamonds", 10],
["Jack of Diamonds", 10],
["Queen of Diamonds", 10],
["King of Diamonds", 10],
["Ace of Diamonds", [1, 11]],
["Clubs", 2],
["Clubs", 3],
["Clubs", 4],
["Clubs", 5],
["Clubs", 6],
["Clubs", 7],
["Clubs", 8],
["Clubs", 10],
["Jack of Clubs", 10],
["Queen of Clubs", 10],
["King of Clubs", 10],
["Ace of Clubs", [1, 11]]
]
#sum = 0
# def initialize_deck(deck, array, value)
#   array.each do |suit|
#     value = 2
#     13.times do |card|
#       if value == 2 || value == 3 || value == 4 || value == 5 || value == 6 || value == 7 || value == 8 || value == 9 || value == 10
#         card = suit
#         new_value = value
#       elsif value == 11
#          card = "Jack of #{suit}"
#          new_value = 10
#        elsif value == 12
#          new_value = 10
#          card = "Queen of #{suit}"
#        elsif value == 13
#          new_value = 10
#          card = "King of #{suit}"
#        else value == 14
#          card = "Ace of #{suit}"
#          new_value = [1, 11]
#        end
#        deck << [card, new_value]
#        value += 1
#      end
#   end
# end
# initialize_deck(deck, suits, value)

# 2. Deal cards to player and dealer
player_hand = []
player_hand = []
dealer_hand = []
dealer_stay_hand = 0
player_stay_hand = 0

def deal(deck, player_hand, dealer_hand)
  values = []
  # sum = 0
    loop do
      puts player_hand
      player_hand.each do |value|
          if value[1] == [1, 11]
            values << value[1][1]
          else
            values << value[1]
          end
        end
        sum = values.reduce(:+)
  puts "Hit or Stay"
  answer = gets.chomp.downcase
  #break if answer == 'stay'
    if answer == 'hit'
      player_hand << deck.slice!(rand(0..deck.size))
    else
      puts "Player stays"
      player_stay_hand = sum
      break
    end
end
# player_stay_hand = sum
end

def dealer(deck, player_hand, dealer_hand)
  values = []
  # sum = 0
    loop do
      if dealer_hand.size < 2
        p dealer_hand + "too small"
      end
      dealer_hand.each do |value|
          if value[1] == [1, 11]
            values << 11
          else
            values << value[1]
          end
        end
        sum = values.reduce(:+)
      if sum < 17
        puts "Dealer hits."
        dealer_hand << deck.slice!(rand(0..deck.size))
        sum = 0
      else
        puts "Dealer stays."
        dealer_stay_hand = sum
        break
      end
  end
  # dealer_stay_hand = sum
end

def start_game(deck, player_hand, dealer_hand)
  2.times { player_hand << deck.slice!(rand(0..deck.size)) }
  2.times { dealer_hand << deck.slice!(rand(0..deck.size)) }
end

def determine_winner(player_stay_hand, dealer_stay_hand)
  if player_stay_hand == 21
    Puts "Player wins!"
  elsif player_stay_hand > 21
    puts "Computer wins!"
  elsif dealer_stay_hand == 21
    puts "Computer wins!"
  elsif dealer_stay_hand > 21
    puts "Player wins"
  elsif dealer_stay_hand > player_stay_hand
    puts "Computer wins!"
  else
    puts "player wins!"
end
end

start_game(deck, player_hand, dealer_hand)
#p player_hand
#p dealer_hand
#p deck
#p dealer_hand[0]
#deal(deck, player_hand, dealer_hand)
dealer(deck, player_hand, dealer_hand)
#determine_winner(player_stay_hand, dealer_stay_hand)
#p dealer_hand
#p dealer_hand.count
#p player_hand.count
#p deck.count
#3. Player turn: hit or stay
  # - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
  # - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.
