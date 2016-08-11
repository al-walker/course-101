# Use require to inlude an external library
require 'pry'

# Initialize a constant that points to an array of strings that represent the suits.
SUITS = ['H', 'D', 'S', 'C']

# Initialize a constant that point to an array of strings that represent the values.
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

# Initialize a constant that points to an integer
HAND_TOTAL = 21

# Initialize a constant that points to an integer
DEALER_STAY = 17

# Initialize variables that point to 0. This sets the initial score values.
player_score = 0
dealer_score = 0

# Define a method with one parameter (that accepts one argument), prints out the argument, and returns nil.
def prompt(msg)
  puts "=> #{msg}"
end

# Define a method that combines the values in SUITS and VALUES and randomizes the results.
def initialize_deck
  SUITS.product(VALUES).shuffle
end

# Define a method with one parameter, cards.
def total(cards)
# The cards argument points to the first two cards dealt to the players in an array of arrays.
  # The .map method iterates through the cards array and maps the values of each card to a new array. The values are accesible by their index, card[1]
  # The cards array is unaffected since .map is non-destructive.
  values = cards.map { |card| card[1] }
  # The sum variable is initialized to 0.
  sum = 0
  # The .each method is used to interate through the array pointed to by the values variable.
  # Each item is assigned to (pointed to by) the block variable, value. The block level variable is not accessible outside of the block.
  values.each do |value|
    # The condtional, if statement, compares the value pointed to with the string "A".
    if value == "A"
      # If the conditional statement is true, sum is reassigned to sum + 11.
      sum += 11
      # If the first conditional statement is not true, and calling .to_i on value returns 0, sum is reassigned to sum + 10
    elsif value.to_i == 0
      sum += 10
      # If the first two conditional statements evaluate to false, reassign sum to sum + the value returned by calling to_i on value.
    else
      sum += value.to_i
    end
  end
# Select from values any value that is equal to the string "A". Count the number of times that select returns true. Execute the code contained in the block the number of times returned by the .count method.
  values.select { |value| value == "A" }.count.times do
    # If the value pointed to by the sum variable is greater than the value stored in the HAND_TOTAL constant (21) reassign sum to sum - 10. (assigning the value of the Ace to one.)
    # If there are no aces, .select returns an empty array. Calling .count on an empty array will return 0, sot the code in the block will not run.
    sum -= 10 if sum > HAND_TOTAL
  end

  sum
end

def busted?(cards)
  total(cards) > HAND_TOTAL
end

def detect_result(d_cards, p_cards)
  player_total = total(p_cards)
  dealer_total = total(d_cards)

  if player_total > HAND_TOTAL
    :player_busted
  elsif dealer_total > HAND_TOTAL
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result

  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?
  puts "------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def score(dealer_cards, player_cards, dealer_score, player_score)
  result = detect_result(dealer_cards, player_cards)
  case result

  when :player_busted
    dealer_score += 1
  when :dealer_busted
    player_score += 1
  when :player
    player_score += 1
  when :dealer
    dealer_score += 1
  end
  puts "Player score: #{player_score} Dealer score: #{dealer_score}"

  if player_score == 5
    puts "5 wins - Player wins game."
  elsif dealer_score == 5
    puts "5 wins - Dealer wins game."
  end
end

def grand_output(dealer_cards, d_total, player_cards, p_total)
  puts "============"
  prompt "Dealer has #{dealer_cards}, for a total of: #{d_total}"
  prompt "Player has #{player_cards}, for a total of: #{p_total}"
  puts "============"

  display_result(dealer_cards, player_cards)
  # update_score(dealer_cards, player_cards, dealer_score, player_score)
end

loop do
  prompt "Welcome to Twenty-One!"
  # initial deal
  # Inititalize the vars
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]},
  for a total of #{total(player_cards)}."

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{total(player_cards)}"
    end

    break if player_turn == 's' || busted?(player_cards)
  end

  player_total = total(player_cards)
  if busted?(player_cards)
    # display_result(dealer_cards, player_cards)

    grand_output(dealer_cards, dealer_total = 0, player_cards, player_total)
    result = detect_result(dealer_cards, player_cards)
    case result

    when :player_busted
      dealer_score += 1
    when :dealer_busted
      player_score += 1
    when :player
      player_score += 1
    when :dealer
      dealer_score += 1
    end
    puts "Player score: #{player_score} Dealer score: #{dealer_score}"

    if player_score == 5
      puts "5 wins - Player wins game."
      break
    elsif dealer_score == 5
      puts "5 wins - Dealer wins game."
      break
    end
    # score(dealer_cards, player_cards, dealer_score, player_score)
    play_again? ? next : break
  else
    prompt "You stayed at #{player_total}"
  end

  # dealer_turn
  prompt "Dealer turn..."
  dealer_total = total(dealer_cards)
  loop do
    break if busted?(dealer_cards) || dealer_total >= DEALER_STAY

    prompt "Dealer hits!"
    dealer_cards << deck.pop
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  dealer_total = total(dealer_cards)
  if busted?(dealer_cards)

    grand_output(dealer_cards, dealer_total, player_cards, player_total)
    # score(dealer_cards, player_cards, dealer_score, player_score)
    result = detect_result(dealer_cards, player_cards)
    case result

    when :player_busted
      dealer_score += 1
    when :dealer_busted
      player_score += 1
    when :player
      player_score += 1
    when :dealer
      dealer_score += 1
    end
    puts "Player score: #{player_score} Dealer score: #{dealer_score}"

    if player_score == 5
      puts "5 wins - Player wins game."
      break
    elsif dealer_score == 5
      puts "5 wins - Dealer wins game."
      break
    end
    play_again? ? next : break
  else
    prompt "Dealer stays at #{dealer_total}"

  end
  # both player and dealer stays - compare cards

  grand_output(dealer_cards, dealer_total, player_cards, player_total)

  result = detect_result(dealer_cards, player_cards)
  case result

  when :player_busted
    dealer_score += 1
  when :dealer_busted
    player_score += 1
  when :player
    player_score += 1
  when :dealer
    dealer_score += 1
  end
  puts "Player score: #{player_score} Dealer score: #{dealer_score}"

  if player_score == 5
    puts "5 wins - Player wins game."
    break
  elsif dealer_score == 5
    puts "5 wins - Dealer wins game."
    break
  end
  # score(dealer_cards, player_cards, dealer_score, player_score)
  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good bye!"
