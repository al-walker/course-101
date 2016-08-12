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
