require 'pry'

def reverse(string)
  array = string.chars
  reverse_string = []
  loop do
    reverse_string << array.pop
    break unless array.size > 0
  end
  reverse_string.join
end

p reverse('hello')
