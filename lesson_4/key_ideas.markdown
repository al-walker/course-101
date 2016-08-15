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
