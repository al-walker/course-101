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

start_game(deck, player_hand, dealer_hand)
