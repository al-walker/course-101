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
# jack = 10
# queen = 10
# king = 10
# ace = [1, 11]

deck = { ['hearts', 'clubs', 'spades', 'diamonds'] =>
         [2 ,3 , 4, 5, 6, 7, 8, 9, 'King', 'Queen', 'Jack', 'Ace' ]
       }
players_cards = []
dealers_cards = []
initial_cards = []
cards_played = []

def initialize_deck
  deck
end
# 2. Deal cards to player and dealer
def deal_cards(deck, cards_played)
  deck.each do |k, v|
    suit = k.to_a.sample(2)
    initial_cards = v.sample(2)
    p cards_played << "#{initial_cards.fetch(0)}" + " of " + "#{suit.fetch(0).capitalize}"
    p cards_played << "#{initial_cards.fetch(1)}" + " of " + "#{suit.fetch(1).capitalize}"
    break if cards_played != cards_played.uniq
    puts "#{initial_cards.fetch(0)}" + " of " + "#{suit.fetch(0).capitalize}"
    puts "#{initial_cards.fetch(1)}" + " of " + "#{suit.fetch(1).capitalize}"
  end
  if cards_played.count != 4
    deal_cards(deck, cards_played)
  end
end

def player_hand(cards_played)
  players_cards << cards_played[0]
  players_cards << cards_played[1]
end

def computer_hand
  dealers_cards << cards_played[2]
  dealers_cards << cards_played[3]
end

def play_round(deck, cards_played)

end

def calculate_cards(hand)
  hand.each do |card|
    if card == 'King' || card == 'Queen' || card == 'Jack'
      card_value = 10
    elsif card == 'Ace'
      card_value == [1, 11]
    else
      card_value = card
    end
  end
end

deal_cards(deck, cards_played)

#3. Player turn: hit or stay
  # - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
  # - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.
