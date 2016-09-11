require 'pry'

def balancer(string)
  parentheses = []
string.chars.select do |c|
  parentheses << c if c == "(" or c == ")"
end
  parentheses.count("(") == parentheses.count(")")
end

p balancer("hi")
p balancer("(hi")
p balancer("(hi)")

# p balancer(")hi(")
