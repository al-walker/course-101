VALID_CHOICES = %w(rock paper scissors lizard Spock)

player_score = 0
computer_score = 0

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'Spock') ||
    (first == 'Spock' && second == 'scissors') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'paper' && second == 'Spock') ||
    (first == 'Spock' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You Won!")
  elsif win?(computer, player)
    prompt("Computer Won!")
  else
    prompt("It's a tie.")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    case choice
    when 'r'
      choice = "rock"
    when 'p'
      choice = "paper"
    when 's'
      choice = "scissors"
    when 'l'
      choice = "lizard"
    when 'S'
      choice = "Spock"
    end

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    player_score += 1
  elsif win?(computer_choice, choice)
    computer_score += 1
  end

  if player_score == 5
    puts "Player: #{player_score} Computer: #{computer_score}"
    puts "Player Wins!"
    break
  elsif computer_score == 5
    puts "Player: #{player_score} Computer: #{computer_score}"
    puts "Computer Wins!"
    break
  else
    puts "Player: #{player_score} Computer: #{computer_score}"
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
