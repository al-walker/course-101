require 'pry'
require 'rubocop'
# Write a method which takes a grocery list
# (array) of fruits with quantities and converts
# it into an array of the correct number of each fruit.

# input
# array of fruit
# quantity of each fruit
#
# output
# an array with the correct number of each fruit
# rules
# get fruit [[0]] * [[1]]
# multiply the string by the amount
# create new array with the number of each fruit .map
#
# test

# Data structure
# Array
# algorithm
# get fruit [[0]] * [[1]]

def buy_fruit(array)
  new_list = []
  number = 0
  array.each do |fruit|
    number = fruit.pop
    number.times do
      new_list << fruit
    end
  end
  new_list.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]

# multiply the string by the amount
# create new array with the number of each fruit .map
#
# abstraction
