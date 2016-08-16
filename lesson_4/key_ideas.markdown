+= is reassignment
numbers are immutable

arrays are mutable
a is a reference to an array.
the array contains three element each of which is itself a reference to a string object.
```ruby
>> a = %w(a b c)
=> ["a", "b", "c"]

>> a.object_id
=> 70227178642840

>> a[1] = '-'
=> "-"

>> a
=> ["a", "-", "c"]

>> a.object_id
=> 70227178642840
```
Several Array methods, such as #delete, #fill, and #insert mutate the original object without creating a new one.

the ability to modify arguments depends in part on the mutability or immutability of the object represented by the argument, but also on how the argument is passed to the method.

Some languages make copies of method arguments, and pass those copies to the method — since they are merely copies, the original objects can’t be modified. Objects passed to methods in this way are said to be passed by value, and the language is said to be using a pass by value object passing strategy.

Other languages pass references to the method instead — a reference can be used to modify the original object, provided that object is mutable. Objects passed to methods in this way are said to be passed by reference, and the language is said to be using a pass by reference object passing strategy.

Pass by value, as you’ll recall, means copying the original objects, so the original object cannot be modified. Since immutable objects cannot be changed, they act like Ruby passes them around by value. This isn’t a completely accurate interpretation of how Ruby passes immutable objects, but it helps us determine why the following code works like it does:

```ruby
def increment(a)
  a = a + 1
end

b = 3
puts increment(b)    # prints 4
puts b               # prints 3
```
 the original object referenced by b is untouched.

 Mutable objects, on the other hand, can always be modified simply by calling one of their mutating methods. They act like Ruby passes them around by reference; it isn’t necessary for a method to modify an object that is passed by reference, only that it can modify the object. As you’ll recall, pass by reference means that only a reference to an object is passed around; the variables used inside a method are bound to the original objects. This means that the method is free to modify those objects. Once again, this isn’t completely accurate, but it is helpful. For instance:
```ruby
 def append(s)
  s << '*'
end

t = 'abc'
puts append(t)    # prints abc*
puts t            # prints abc*
```

Here, the String object abc is mutable. You can reasonably say that t is modified by #append since t is passed by reference to #append where it is bound to variable s. When s is modified by append, it modifies the same object referenced by t, so upon return from the method, t still refers to the original (albeit modified) String object.

 Ruby variables are merely references to objects in memory

 a variable is merely a name for some object

 Multiple variables can refererence the same object, so modifying an object using a given variable name will be reflected in every other variable that is bound to that object.

assignment to a variable merely changes the binding; the object the variable originally referenced is not modified. Instead, a different object is bound to the variable.

certain object types, primarily numbers and Booleans but also some other types, are immutable in Ruby

If you attempt to change an immutable object, you won’t succeed — at best, you can create a new object, and bind a variable to that object with assignment. Mutable objects, however, can be modified without creating new objects.

We’ve established a mental model that says that Ruby is pass by value for immutable objects, pass by reference otherwise. This model isn’t perfect, but it can be used to help determine whether the object associated bound to an argument will be modified.

All methods are non-mutating with respect to immutable objects. A method simply can’t modify an immutable object. Thus, any method that operates on numbers and boolean values is guaranteed to be non-mutating with respect to that value.

Of particular interest when discussing non-mutating methods is assignment with =. As we saw in Variable References and Mutability article, assignment merely tells Ruby to bind an object to a variable. This means that assignment does not change an object; it merely connects the variable to a new object. While = is not an actual method in Ruby, it acts like a non-mutating method, and should be treated as such.

```ruby
def fix(value)
  value.upcase!
  value.concat('!')
  value
end

s = 'hello'
t = fix(s)
```
We start by passing s to fix; this binds the String represented by “hello” to value. In addition, s and value are now aliases for the String.

Next, we call #upcase! which converts the String to uppercase. A new String is not created; the String that is referenced by both s and value now contains the value "HELLO".

We then call #concat on value, which also modifies value instead of creating a new String; the String now has a value of "HELLO!", and both s and value reference that object.

Finally, we return a reference to the String and store it in t.

The only place we create a new String in this code is when we assign “hello” to s. The rest of the time, we work directly with that object, modifying it as needed. Thus, both s and t reference the same String, and that String has the value 'HELLO!'.

```ruby
def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

In this modified code, we assign the return value of value.upcase back to value. Unlike #upcase!, #upcase does not modify the String referenced by value; instead, it creates a new copy of the String referenced by value, modifies the copy, and then returns a reference to the copy. We then bind value to the returned reference.

The rest of the program runs as before, but if you look at the results in irb, you’ll see that things are quite different:

```ruby
>> def fix(value)
--   value = value.upcase
--   value.concat('!')
-- end
=> :fix

>> s = 'hello'
=> "hello"

>> s.object_id
=> 70349169469400

>> t = fix(s)
=> "HELLO!"

>> s
=> "hello"

>> t
=> "HELLO!"

>> s.object_id
=> 70349169469400

>> t.object_id
=> 70349169435840
```
s and t now reference different objects, and the String referenced by s has not been modified. What happened here?


This shows that value = value.upcase bound the return value of value.upcase to value; value now references a different object than it did before. Prior to the assignment, value referenced the same String as referenced by s, but after the assignment, value references a completely new String; the String referenced by #upcase’s return value.

```ruby
def fix(value)
  puts "initial object #{value.object_id}"
  value = value.upcase
  puts "upcased object #{value.object_id}"
  value.concat('!')
end

s = 'hello'
puts "original object #{s.object_id}"
t = fix(s)
puts "final object #{t.object_id}"
```

```ruby
original object 70349169469400
initial object 70349169469400
upcased object 70349169435840
final object 70349169435840
```

Assignment always binds the target variable on the left hand side of the = to the referenced by the right hand side. The object originally referenced by the target variable is never modified.

However, be aware that any mutating operations prior to the assignment may still take place:

```ruby
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end
s = 'hello'
t = fix(s)
```
This program modifies the original string so its value is helloxyz. However, thanks to the assignment, it is not changed to HELLOXYZ or HELLOXYZ!; those changes occur in a different object that gets returned by the method.

These types of issues arise not only with assignment, but also with assignment operators like *=, +=, and %=. These are all implemented in terms of assignment, and that assignment always causes the target to reference a possibly different object. None of these operations mutate their operands.

```ruby
>> s = 'Hello'
=> "Hello"

>> s.object_id
=> 70101471465440

>> s += ' World'
=> "Hello World"

>> s
=> "Hello World"

>> s.object_id
=> 70101474966820
```

Though it looks as if we are modifying s when we write s += ' World', we are actually creating a brand-new String with a new object id, and then binding s to that new object. We can see by looking at the object ids that a new object is created.

String#concat is a mutating method, but it does not include a !.

Consider the String#strip! method that removes leading and trailing whitespace from a String object:

Indexed Assignment is Mutating

Indexed assignment, such as that used by String, Hash, and Array objects can be confusing:

```ruby
str[3] = 'x'
array[5] = Person.new
hash[:age] = 25
```

This looks exactly like assignment, which is non-mutating, but is, in fact, mutating. #[] modifies the original object (the String, Array, or Hash). It doesn’t change the binding of each variable.

```ruby
def fix(value)
  value[1] = 'x'
  value
end

s = 'abc'
t = fix(s)
p s            # "axc"
p t            # "axc"
p s.object_id  # 70349153406320
p t.object_id  # 70349153406320
```
Earlier, we saw similar code that merely assigned to value, and we saw that performing assignment bound value to a completely new String. Thus, s and t referenced different objects.

Here, though, we are using indexed assignment instead, and, perhaps surprisingly, the binding does not change. Even after the assignment to value[1], value still references the same (albeit mutated) String object.

The reason for this is that indexed assignment is a method that a class must supply if it needs indexed assignment. This method is named #[]=, and #[]= is expected to mutate the object to which it applies. It does not create a new object.

```ruby
>> a = [3, 5, 8]
=> [3, 5, 8]

>> a.object_id
=> 70240541515340

>> a[1].object_id
=> 11

>> a[1] = 9
=> 9

>> a[1].object_id
=> 19

>> a
=> [3, 9, 8]

>> a.object_id
=> 70240541515340
```

Here, we can see that we have mutated the Array a by assigning a new value to a[1], but have not created a new Array. a[1] = 9 isn’t assigning anything to a; it is assigning 9 to a[1]; that is, this assignment changes a[1] so that it references the new object 9. You can see this by looking at a[1].object_id both before and after the assignment. Despite this change, though, a itself still points to the same (now mutated) Array we started with.

This is normal behavior when working with objects that support indexed assignment: the assignment does cause a new reference to be made, but it is the collection element e.g., (a[1]) that is bound to the new object, not the collection (enclosing object) itself.

Concatenation is Mutating

The << operator is actually a method that is defined for some classes.

Certain operations, like setters and indexed assignments should always be treated as mutating methods; others, like assignment and the assignment operators (+=, *=, etc) are always non-mutating.
