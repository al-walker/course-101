require 'pry'

def backward?(parentheses)
  parentheses == [')', '(']
end

def balancer(string)
  parentheses = []
  string.chars.select do |c|
    parentheses << c if c == "(" || c == ")"
  end
  return false if backward?(parentheses)
  parentheses.count("(") == parentheses.count(")")
end

p balancer("hi")
p balancer("(hi")
p balancer("(hi)")

p balancer(")hi(")
