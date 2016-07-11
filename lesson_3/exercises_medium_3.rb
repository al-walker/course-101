# Question 1

# Ruby re-uses objects when values are the same (same object == same object_id)
# Ruby does not change the id based on position inside or outside of blocks
# Changing values forces Ruby to create new objects and refer to them with the original names.
# Ruby re-uses the objects under the hood when it can, but uses different ones for different values.
# Once we leave a block, those variables that were defined inside the block lose their meaning.

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block.\n\n"

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer).\n\n"
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block.\n\n"

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block.\n\n" rescue puts "ugh ohhhhh"
end

fun_with_ids

=begin
Question 2

1. Like before the 'outers' are not the same variables as those outside.
2. Ruby is simply re-using the objects since he new variables have the same values as those outside
3. When we change the values of our 'outers', Ruby uses new objects for these variabbles to deal with their new values.
4. Even though we changed the values of our 'outer' variables inside the method call, we still have the same object id's after the method.
5. Reason - Our method accepts values as parameters. The names we give those values in the definition of our method are separate from any other use of those same names.
6. We could have called the parameters of our method anything.
7. The method gets the values of th parameters we pass, but the parameter variables inside the method have no other relationship to those outside of the method.
8. Our main method still has no access to variables that are defined inside of the method.

Question 3

1. Ruby treats string and array parameters exactly the same way.
2. In both cases, Ruby passes the parameter 'by' value. The value that gets passed is a reference to som object.
3. A string parameter is passed to the method as a reference to an object of type String.
4. An Array parameter is passed to the method as a reference to an object of type Array.
5. Th method makes up a new variable and puts the references in these new variables.  The new variables only live within the scope of the method.
6. The String#+= operation is reassignment. (creates a new String object)
7. The reference to this new object is placed in the internal variable of the method.
8. The method has forgotten about the the one that was passed in now.
9. Using the << operator Ruby simply keeps using the same object that was passed in and appends the new element to it.
10. The caller's array variable and the method's array variable point at the same object. We see the results of what happened to the array outside of the method.

Question 4

1. With the Array#= ['pumpkins', 'rutabaga'] is a new object. We are setting the internal array variable equal to that new array literal object.
=end

#Question 5

def color_valid(color)
  color == "blue" || color == "green"
end

# Ruby will automatically evaluate statements, so the is statement is not necessary.
