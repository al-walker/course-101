The display result method returns a symbol. The symbol is assigned to the variable, result. This variable is then used in a case statement to display the the results of the game to the player. The results are displayed by passing a string as an argument to the prompt method.

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

The play_again? method accepts input from the player using the gets method. The trailing new line character is removed by calling the .chomp method on the result of .gets.  The result of gets.chomp is assigned to the varable, answer.  The play_again? method returns an boolean value. The question mark at the end is a Ruby convention to signify that a method returns true or false. The statement
```ruby
answer.downcase.start_with?('y')
```
 in the pry session example returns true and it is the last statement in the method so it is implicitly returned. This statement contains chained methods.  The variable answer points to the user response.  .downcase makes sure that the user input is lower case by downcsing the string assigned to answer. The method start_with? accepts one argument.  In this case it is the string 'y'. The method compares the downcased version of the string assigned to answer with the string supplied as the argument to the method.  If the comparison evaluates to true, start_with? returns true.
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
