def prompt(text)
  puts "=> #{text}"
end

loop do # main loop
  prompt("Welcome to the loan calculator.")

  loan_amount = ''
  loop do
    prompt("Enter a loan amount")

    loan_amount = gets.chomp

    if loan_amount.empty? || loan_amount.to_f < 0
      prompt("Please enter a positive number.")
    else
      break
    end
  end

  apr = ''
  loop do
    prompt("Enter the APR")
    apr = gets.chomp

    if apr.empty? || apr.to_f < 0
      prompt("Please enter a positive number.")
    else
      break
    end
  end

  loan_duration = ''
  loop do
    prompt("Enter the loan duration in years")
    loan_duration = gets.chomp

    if loan_duration.empty? || loan_duration.to_i < 0
      prompt("Please enter a positive number.")
    else
      break
    end
  end

  annual_interest_rate = apr.to_f / 100

  monthly_interest_rate = annual_interest_rate / 12

  loan_duration_in_months = loan_duration.to_i * 12

  monthly_payment = loan_amount.to_f() *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**-
                    loan_duration_in_months.to_i()))

  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")

  prompt("Would you like to calculate another loan payment? (Y or N)")

  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end # end main loop

prompt("Thank you for using the loan calculator.")
prompt("Goodbye")
