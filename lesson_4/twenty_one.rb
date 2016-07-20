require 'pry'

player_hand = []
dealer_hand = []

#1. Initialize deck

deck =
[["Hearts", 2], ["Hearts", 3],["Hearts", 4],["Hearts", 5],["Hearts", 6],
["Hearts", 7], ["Hearts", 8], ["Hearts", 9], ["Hearts", 10], ["Jack of Hearts", 10],
["Queen of Hearts", 10], ["King of Hearts", 10], ["Ace of Hearts", [1, 11]],
["Spades", 2], ["Spades", 3], ["Spades", 4], ["Spades", 5], ["Spades", 6],
["Spades", 7], ["Spades", 8], ["Spades", 9], ["Spades", 10], ["Jack of Spades", 10],
["Queen of Spades", 10], ["King of Spades", 10], ["Diamonds", 2], ["Diamonds", 3],
["Diamonds", 4], ["Diamonds", 5], ["Diamonds", 6], ["Diamonds", 7], ["Diamonds", 8],
["Diamonds", 9], ["Diamonds", 10], ["Jack of Diamonds", 10], ["Queen of Diamonds", 10],
["King of Diamonds", 10], ["Ace of Diamonds", [1, 11]], ["Clubs", 2], ["Clubs", 3],
["Clubs", 4], ["Clubs", 5], ["Clubs", 6], ["Clubs", 7], ["Clubs", 8], ["Clubs", 10],
["Jack of Clubs", 10], ["Queen of Clubs", 10], ["King of Clubs", 10],
["Ace of Clubs", [1, 11]]]

# 2. Deal cards to player and dealer

def start_game(deck, player_hand, dealer_hand)
  2.times { player_hand << deck.slice!(rand(0..deck.size)) }
  2.times { dealer_hand << deck.slice!(rand(0..deck.size)) }
end

#3. Player turn: hit or stay
  # - repeat until bust or "stay"

def player_turn(deck, player_hand)
  sum = 0
  answer = ''
  until answer == 'stay'
  puts "Hit or Stay"
  answer = gets.chomp.downcase
  if answer == 'hit'
    player_hand << deck.slice!(rand(0..deck.size))
    calculate_sum(player_hand)
    break if determine_bust(player_hand)
    puts "#{player_hand}"
  else
    puts "#{player_hand}"
  end
end
p calculate_sum(player_hand)
end

def dealer_turn(deck, dealer_hand)
  answer = ''
  sum = 0
  until answer == 'stay'
    calculate_sum(dealer_hand)
    break if determine_bust(dealer_hand)
  if dealer_hand < 17
    dealer_hand << deck.slice!(rand(0..deck.size))
  elsif dealer_hand >= 17
    puts "Dealer stays #{sum}"
    answer == 'stay'
  end
end
calculate_sum(dealer_hand)
end

def handle_ace(value)
  sum = 0
  #values = []
  #hand.each do |value|
      if sum + 11 <= 21
        value[1] = 11
      elsif sum + 11 > 21
        value[1] = 1
      end
    value[1]
end

def determine_bust(hand)
  values = []
  hand.each do |value|
      values << value[1]
      handle_ace(values)
    calculate_sum(hand)
    if calculate_sum(hand) > 21
      return true
    end
end
end

def calculate_sum(hand)
  sum = 0
  values = []
  hand.each do |value|
    if value[1] == [1, 11]
      handle_ace(value[1])
      values << value[1]
  else
      values << value[1]
    end
    sum = values.reduce(:+)
    binding.pry
end
sum
end

def determine_winner(player_total, dealer_total)
if player_total > dealer_total
  puts "Player wins: #{player_total}"
else
  puts "Dealer wins: #{dealer_total}"
end
end


start_game(deck, player_hand, dealer_hand)
p player_hand
p dealer_hand
p player_turn(deck, player_hand)
p dealer_turn(deck, dealer_hand)
determine_winner(player_turn(deck, player_hand), dealer_turn(deck, dealer_hand))
