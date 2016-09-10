def fizzbuzz(num1, num2)
  fizzbuzz_array = []
  (num1..num2).each do |n|
    if n % 3 == 0 && n % 5 == 0
      fizzbuzz_array << 'fizzbuzz'
    elsif n % 3 == 0
      fizzbuzz_array << 'fizz'
    elsif n % 5 == 0
      fizzbuzz_array << 'buzz'
    else
      fizzbuzz_array << n
    end
  end
  fizzbuzz_array
end

p fizzbuzz(1, 15)
