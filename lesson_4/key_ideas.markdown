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
