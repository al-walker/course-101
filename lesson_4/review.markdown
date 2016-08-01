local variable scope, especially how local variables interact with blocks and methods


local variable or method call - sometimes ambiguous - ruby syntactical sugar

method invocation - parentheses optional
puts("hello")

str = "a string"
printing out the value of the str variable

def str
  "a method"
end
printing out the return value of the method invocation
if you have both p str references the local variable. if I want to invoke the method when I have both - I put p str() - with the parentheses. which is actually p( str() )
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


local variable scope

arr = [1, 2, 3, 4]

counter = 0
sum = 0
  # local variables initialized outside the block are accessible inside the block.
loop do
 sum += arr[counter]
 counter += 1
  break if counter == arr.size

  new_var = "hello"
  # If there is a new variable initialized in an inner scope, it is not available in the outer scope.
end

puts "Your total is #{sum}"

str = "hello"

loop do
  # yes accesible outside of block
  # puts str
  # str = "world"
  # yes changed outside of block
 break
  end

  puts str

  reassignment (yes, available in outer scope if reassigned in inner scope but originally initialized in outer scope) vs. initialization (not available outer scope if initialized in inner scope) no keyword differentiating reassignment and initialization n Ruby


The more precise answer would be "the method outputs the string hello word, and returns nil". In programming, we are always concerned with the output and the return value and mutations to objects. We need to speak in those terms, and not use vague words

global variables start with a dollar sign - don't use at this point

Pass by reference vs pass by value
Variables as pointers
Method return value vs side effects

methods create their own scope

str does not exist in this method.

def amethod(param)
  str += " world"
end

def amethod(param)
  param += " world" # this line is going to return a new string object
end

str = "hello" # str in unmodified by the above method
amethod(str)

p str


def amethod(param)
  param << " world" # str is modified
end

param += " world" # reassignment param = param + " world" We are reassinging param to a new object that just happens to have the same name
param + " world" # string concatenation (non destructive) returns a new object + looks like an operator but it is a method +(" world") - you are not saving the new string so it just goes away.
param << " world" # << is a method call that mutates the calling object will see the change outside of the method. It is a destructive method invocation.

The first two will not have a permanent effect on str
The third will have apermanent effect

def amethod(param) # param is assigned to str param = str
  param += " universe" # param = param + " universe" - reassignment - new object sprang to life - param is no longer pointing to the same object as str - only the return value of amethod  can be affected now not str
  # param + " universe" This is not reassignment - ->new_object
  param << " world" # operating on a new str object that has noting to do with the passed in str object.
end

str = "hello"
amethod(str)

p str # "hello"

Variables as pointers to objects

a = "hello"
b = a

mental model = variables point to objects
objects live in memory - take up space in memory

not reassignment - two variable initializations
a is initialized to point to "hello"
b is initialized to point to the same object
two variables - one object

b << " world"
the left shift operator << is a destructive call - it is going into the object and modifying the value - it is not returning an new object
puts a # "hello world"
puts b # "hello world"

We have two variables and one object at this point. Any destructive call will modify the object and a and b will both see the change.

a = "hey"

Now  there are 2 variables and two objects a is now pointing to the new object with the value "hey"

a = a + b
a += b
These will also return a new string object - reassignment 2 "hello world"s but a new object

b << " universe"

puts a # "hey" reassignment
puts b # "hello world universe"

+= is reassignment
+ concatenate returns new string str -> new_str
<< append str -> str

# class methods
:: instance methods
in docs :: or #

-> if different on both sides new object is created
-> if same destructive

return value of a method vs. side effects

def prefix(str)
  "Mr. " + str  # + returns a new string and we are not capturing it
end

can fix by
name = prefix(name) # reassigning name based on the return value of prefix
or
"Mr. " << str # make the operation destructive so str will be changed

Which we use depends on if it makes sense for the method to have side effects.

It is dangerous to make permanent changes to objects you pass in.

You can use prefix! to signify that this method will do something destructive.

It's easier to use the first non destructive solution to fix the problem.

Don't make a method where you use the return value and it has side effects.  Don't mix. Can be dangerous. Code with intention. Be intentional when you code.

name = 'joe'
prefix(name)

puts name
