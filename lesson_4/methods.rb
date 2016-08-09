# Adding parentheses allows this code to work.
(('hello' + 'world').split << 'hi').join.split('')
=> ["h", "e", "l", "l", "o", "w", "o", "r", "l", "d", "h", "i"]

# def is_a_number?(word)
#  word.is  _a? Integer
# end
#
# p is_a_number?('1') # => false
# p is_a_number?(1) # => true
# p is_a_number?('hello'.to_i) # => true
#
# def is_a_number?(word)
#   Integer(word) rescue false
# end
#
# p is_a_number?('1') # => 1
# p is_a_number?(1) # => 1
# p is_a_number?('hello'.to_i) # => 0

# require 'pry'
#
# player_hand = []
# dealer_hand = []
# player_total = 0
# dealer_total = 0
#
# # Initialize Deck
# cards =
#   [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6'],
#    ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J'],
#    ['H', 'Q'], ['H', 'K'], ['H', 'A'], ['S', '2'], ['S', '3'],
#    ['S', '4'], ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'],
#    ['S', '10'], ['S', 'J'], ['S', 'Q'], ['S', 'K'], ['S', 'A'],
#    ['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'],
#    ['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'],
#    ['D', 'K'], ['D', 'A'], ['C', '2'], ['C', '3'], ['C', '4'],
#    ['C', '5'], ['C', '6'], ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'],
#    ['C', 'J'], ['C', 'Q'], ['C', 'K'], ['C', 'A']]
#
# # Deal cards to player and dealer
#
# def start_game(cards, player_hand, dealer_hand)
#   binding.pry
#   2.times { player_hand << cards.slice!(rand(0..cards.size - 1)) }
#   2.times { dealer_hand << cards.slice!(rand(0..cards.size - 1)) }
#   puts "Dealer has: #{dealer_hand[0]} and an unknown card."
#   puts "You have: #{player_hand}"
# end
#  start_game(cards, player_hand, dealer_hand)

# score = 0
# letter = 'a'
#
# def increment_score(num)
#   num += 1
# end
#
# def change_letter(l)
#   l = 'b'
# end
#
# new_score = increment_score(score)
# p increment_score(score)
# p score
# p new_score
#
# puts "The score is #{score}"
# puts "The score is #{increment_score(score)}"
#
# new_letter = change_letter(letter)
# p change_letter(letter)
# p letter
# p new_letter
