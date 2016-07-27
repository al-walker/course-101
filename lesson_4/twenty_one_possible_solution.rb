require 'pry'

SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
HAND_TOTAL = 21
DEALER_STAY = 17
player_score = 0
dealer_score = 0

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == "A" }.count.times do
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

def grand_output(dealer_cards, d_total, player_cards, p_total)
  puts "============"
  prompt "Dealer has #{dealer_cards}, for a total of: #{d_total}"
  prompt "Player has #{player_cards}, for a total of: #{p_total}"
  puts "============"

  display_result(dealer_cards, player_cards)
  #update_score(dealer_cards, player_cards, dealer_score, player_score)

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
    result = detect_result(dealer_cards, player_cards)

    grand_output(dealer_cards, dealer_total = 0, player_cards, player_total)

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

  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good bye!"
