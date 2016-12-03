# input
# string with one or more space separated words
# output
# hash - number of words of different sizes

# Algorithm data structure - String / hash
# split words by space
# split each word into chars
# count each array of word chars
# join each array of word chars
# initialize a hash
# insert the letter count as key and number of words
# with that # of letters as value

# pseudocode/Algorithm
# create hash to hold # of letters and number of words.
# create a counter that will be incremented when a # is seen again
# split phrases on spaces
# split each word into letters and count the number of them.
# insert the number of letters into the hash.
# if the number of letters already esists in the hash, increment the counter by 1
# add the counter as the value for that key
# else add the number of letters and the alue of 1
#

def word_sizes(phrase)
  word_count_hash = {}
  counter = 1
  phrase.split(' ').each do |word|
    if !word_count_hash.include?(word.chars.count)
      word_count_hash[word.chars.count] = 1
    else
      word_count_hash[word.chars.count] += 1
    end
  end
  word_count_hash
end

# test
p word_sizes('hi al me the')
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!')  == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
