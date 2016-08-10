'''ruby
def test(name)
  hello << name
end
'''

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

class methods #
instance methods ::
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

Arrays and Hashes

develop clarity on these concepts

How do you know a method will mutate an argument?
If the operation inside the method invokes a destructive call.

However, if there is reassignment that happens beforehand, the destructive action is being invoked on a new method unrelated to the one you passed in.

variables are pointers to objects.

a variable can be initialized to an existing object.

a = 'hi' # a is pointing to an object 'hi'
b = a # b is pointing to an existing object 'hi'

a += b  # a is being reassigned to a new object. 'hihi'

>> a = 'hi'
=> "hi"
>> b = a
=> "hi"
>> a += b
=> "hihi"
>> a
=> "hihi"
>> b
=> "hi"

we now have two variables pointing to two objects.

4.times { puts 'hi' }
'hi'.capitalize

a destructive action called on an object changes the value of that object.
all variables pointing to that object will see the change.

when variables point to objects, they can retrieve the value or they can update the value.

collections

arrays, hashes, strings

data structure means a structure that holds data.

a collection is a type of data structure

an array [4, 3, 2, 1] series of elements retrievable by index starts at 0
a hash {:a => 1} or {a: 1} key value pairs dictionary keys must be unique.

In ruby hash order is preserved but we don't retrieve by order we retrieve by key
In an array order matters we retrieve by index

symbols are immutable

symbols are not StringLiterals
hsh = {a: 1}
if you use hsh['a'] to retrieve will return nil with no error
if you use hsh.fetch('a') will return a key not found: 'a' error
hsh.fetch(:a)
=> 1

think of symbols as immutable strings

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts arr[4] => 5

idx = 0
loop do
  puts arr[idx]
  idx += 1
  break if idx == arr.size
end

The block is getting passed into the each method.
It is an argument.
like an anonymous function
a way to pass chunks of code around in Ruby (closures)
each will do somthing with each element in the array.
arr.each do |n|
  puts n
end

The return value is different the loop returns nil
each returns the original array

We need to be aware of the return value of our code.

arr.each do |n|
  puts n if n > 5
end

append 12 to the end of the array
arr << 12
prepend 0 to the beginning of the array
arr.unshift(0)
remove the 12 and add a 3
arr.pop
arr << 3
uniq returns a new array without duplicates doesn't affect arr
arr.uniq!
uniq! changes arr

arr.select { |n| n.odd? }

best definition - select returns a new array based on the blocks's return value.  If the return value evaluates to true, then the element is selected.
odds = arr.select do |n|
  n + 1
  puts n
end

puts n returns nil so the entire block returns nil so no element is selected.
when n + 1 was the last line it evaluates to true so the entire block returns true so all elements are selected.

select cares about the return values truthiness

definition of map - map is transformation not selection
map returns a new array based on the block's return value. Each element is transformed based on the return value.

incremented = arr.map { |n| n + 1 }

incremented = arr.map do |n|
  n.odd? # returns array of booleans
  puts # returns an array of nils
end

Even simple methods have depth to them. You need a precise definition of how they work.

hsh = {a: 1, b: 2, c: 3, d: 4, e: 5}

hsh[:b]

hsh[:e] = 5

hsh.each do |k, v|
  puts "key is #{k} and value is #{v}" if v < 3.5
end

small_vals = hsh.select do |k, v|
  v < 3.5
end

delete_if is a destructive call
small_vals = hsh.delete_if do |k, v|
  v < 3.5
end

if you have

arr << hsh
last element is a giant hash
hsh[:f] = 6
arr is modified because variables are pointers this object is part of the array

hsh is pointing to an object - hsh goes into the array but it still points to the object

if you have a variable pointing to an object in a data structure - the data structure could change if the object that is pointed to changes.

Common mistakes when using select and map
- must have a precise definition.
The Enumerable module
-.all? .any? can ask questions they return true or false

.all? comes from the Enumerable module - mixed into arrays and hashes.
.max .min .map .reject .sort .to_a

collection oriented methods in this module
The class must provide a message each to use Enumerable
to mix in Enumerable all you need is an .each method
