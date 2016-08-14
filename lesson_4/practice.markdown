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

This loop structure prompts the player to enter an 'h' or an 's'. The response is downcased and assigned to the player_turn variable. The array method .include? is used to determine if the player entered the appropriate values.  The value assigned to the player_turn variable is passed to the .include? method.  This value is compared to the two values assigned to the array.  If the value passed into the .include? method matches one of the array values, the method returns true.  If not, the method returns false.

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

This example is from the tic-tac-toe bonus features assignment.  It forms part of the computer players AI.  If a square has not yet been selected by the computer
```ruby
!square
```
and the value for the brd hash key 5 is an empty string,
```ruby
brd.values_at(5) == [" "]
```
The computer selects this space by assigning its key to the variable, square.
The pry session below demonstrates how chaining the .select, .invert, and .fetch methods together achieve the goal of assigning the ineger, 5, to the variable, square. First, the hash with the key of 5 is selected. The invert method reverses the hash making the integer 5 the value and the empty string the key. .invert is non-destructive, so the effect is temporary, only for the duration of these chained method calls. The .fetch method retrieves the value using the empty string as the key.  .fetch takes the key as an argument and returns the value associated with that key.

```ruby
77:   if !square
    78:     if brd.values_at(5) == [" "]
    79:       square = brd.select { |k, _| k == 5 }.invert.fetch(' ')
    80:     end
    81:   end
[1] pry(main)> square
=> 5
[2] pry(main)> brd.select { |k, _| k == 5 }
=> {5=>" "}
[3] pry(main)> brd.select { |k, _| k == 5 }.invert
=> {" "=>5}
[4] pry(main)> brd.select { |k, _| k == 5 }.invert.fetch(' ')
=> 5
[5] pry(main)> brd.values_at(5) == [" "]
=> true
[6] pry(main)> !square
=> false
```

The string "0" is assigned to the constant, COMPUTER_MARKER. This string is assigned to the value of brd hash with the key of 5.
```ruby
brd[square] = COMPUTER_MARKER
```
The value, 5, is assigned to the variable, square by the preceding sample code.

```ruby
brd[square] = COMPUTER_MARKER
 => 88:   binding.pry
    89: end

[1] pry(main)> COMPUTER_MARKER
=> "O"
[2] pry(main)> brd[square]
=> "O"
[3] pry(main)> square
=> 5
[4] pry(main)> brd[square] = COMPUTER_MARKER
=> "O"
```

```ruby
WINNING_LINES.each do |line|
   66:     square = go_for_the_win(line, brd)
   67:     break if square
=> 68:     binding.pry
   69:   end
```

```ruby
[1] pry(main)> line
=> [1, 2, 3]
[2] pry(main)> WINNING_LINES
=> [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
[3] pry(main)> square
=> nil
[4] pry(main)> find_at_risk_square(line, brd)
```

```ruby
92: def find_at_risk_square(line, board)
    93:   if board.values_at(*line).count(PLAYER_MARKER) == 2
    94:     board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
    95:   end
 => 96:  binding.pry
    97: end

[1] pry(main)> line
=> [1, 2, 3]
[2] pry(main)> board
=> {1=>" ", 2=>" ", 3=>"X", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
[3] pry(main)> board.values_at(*line)
=> [" ", " ", "X"]
[4] pry(main)> board.values_at(*line).count(PLAYER_MARKER)
=> 1
[5] pry(main)> board.values_at(*line).count(PLAYER_MARKER) == 2
=> false
[6] pry(main)> board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys
=> [1, 2]
[7] pry(main)> board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
=> 1
```
