The display_result method returns a symbol. The symbol is assigned to the variable, result. This variable is then used in a case statement to display the the results of the game to the player. The results are displayed by passing a string as an argument to the prompt method.

```ruby
95: def display_result(dealer_cards, player_cards)
     96:   result = detect_result(dealer_cards, player_cards)
     97:
     98:   case result
     99:
    100:   when :player_busted
    101:     prompt "You busted! Dealer wins!"
    102:   when :dealer_busted
    103:     prompt "Dealer busted! You win!"
    104:   when :player
    105:     prompt "You win!"
    106:   when :dealer
    107:     prompt "Dealer wins!"
    108:   when :tie
    109:     prompt "It's a tie!"
    110:   end
 => 111:   binding.pry
    112: end

[1] pry(main)> result
=> :dealer_busted
```

The play_again? method accepts input from the player using the gets method. The trailing new line character is removed by calling the .chomp method on the result of .gets.  The result of gets.chomp is assigned to the varable, answer.  The play_again? method returns a boolean value. The question mark at the end is a Ruby convention to signify that a method returns true or false. The statement
```ruby
answer.downcase.start_with?('y')
```
 in the pry session example returns true and it is the last statement in the method so it is implicitly returned. This statement contains chained methods.  The variable answer points to the user response.  .downcase makes sure that the user input is lower case by downcasing the string assigned to answer. The method start_with? accepts one argument.  In this case it is the string 'y'. The method compares the downcased version of the string assigned to answer with the string supplied as the argument to the method.  If the comparison evaluates to true, start_with? returns true.
```ruby
115: def play_again?
    116:   puts "------------"
    117:   prompt "Do you want to play again? (y or n)"
    118:   answer = gets.chomp
    119:   answer.downcase.start_with?('y')
 => 120:   binding.pry
    121: end

[1] pry(main)> answer
=> "y"
[2] pry(main)> answer.downcase.start_with?('y')
=> true
```

The grand_output method definition defines four parameters. When the grand_output is called, four arguments must be passed in to the method. This outside information will be used to display the grand output to the player. Strings containing the interpolated values of variables passed to the method are displayed by passing these strings to the prompt method. The grand_output method displays the outcome of the game and returns nil. This is due to the last statement in the method, display_result(dealer_cards, player_cards).

```ruby
122: def grand_output(dealer_cards, d_total, player_cards, p_total)
    123:   puts "============"
    124:   prompt "Dealer has #{dealer_cards}, for a total of: #{d_total}"
    125:   prompt "Player has #{player_cards}, for a total of: #{p_total}"
    126:   puts "============"
    127:
    128:   display_result(dealer_cards, player_cards)
    129:   # update_score(dealer_cards, player_cards, dealer_score, player_score)
 => 130:   binding.pry
    131: end

[1] pry(main)> display_result(dealer_cards, player_cards)
=> Dealer busted! You win!
=> nil
[2] pry(main)> dealer_cards
=> [["C", "Q"], ["C", "6"], ["D", "9"]]
[3] pry(main)> d_total
=> 25
[4] pry(main)> player_cards
=> [["D", "2"], ["C", "K"], ["D", "4"]]
[5] pry(main)> p_total
=> 16
```

```ruby
150:   loop do
   151:     player_turn = nil
   152:     loop do
   153:       prompt "Would you like to (h)it or (s)tay?"
   154:       player_turn = gets.chomp.downcase
=> 155:       binding.pry
   156:       break if ['h', 's'].include?(player_turn)
   157:       prompt "Sorry, must enter 'h' or 's'."
   158:     end
   159:
   160:     if player_turn == 'h'

[1] pry(main)> player_turn
=> "h"
[2] pry(main)> ['h', 's'].include?(player_turn)
=> true
```

This loop structure prompts the player to enter an 'h' or an 's'. The response is downcased and assigned to the player_turn variable. The array method .include? is used to determine if the player entered the appropriate values.  The player_turn variable id passed to the .include? method.
