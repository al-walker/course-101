1. local variable scope, especially how local variables interact with blocks and methods
-------
local variable or method call - sometimes ambiguous - ruby syntactical sugar

method invocation - parentheses optional
puts("hello")

str = "a string"
printing out the value of the str variable

def str
  "a method"
end
printing out the return value of the method invoction
if you have both p str references the local variable. if I want to invoke the mehtod when I have both - I put p str() - with the parentheses. which is actually p( str() )
p str

bob.name = 'bob' # not assignment - invoking a method on bob - the method is named = equals
bob.name=('bob') # parentheses optional
name equals method

def >(other)
  self.age > other.age
end
p( bob.>(jim) )
or
p bob > jim
-------
Where does the code come from

Core API - loaded into the Ruby runtime that allows you to invoke methods - They are organized into classes or modules (ways to organize methods)

Kernel - Core

puts lives inside of Kernel
invoking Kernel method puts
All methods in core classes are available without doing anything extra

Standard Library - not automatically loaded - keep language from bloating - processing CSV files, prime

require 'prime'

def is_prime?(num)
  num.prime?
end

(1..5).each do |n|
  is_prime?(n)
end

external library or gem like pry
require 'pry'
---------

global variables start with a dollar sign - don't use at this point

variables as pointers
