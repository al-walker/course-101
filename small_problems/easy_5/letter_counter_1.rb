# input
# string with one or more space separated words
# output
# hash - number of words of different sizes

# test

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}

# Algorithm data structure - String / hash
# split words by space
# split each word into chars
# count each array of word chars
# join each array of word chars
# initialize a hash
# insert the letter count as key and number of words
# with that # of letters as value

# pseudocode

def word_sizes(phrase)
  word_count_hash = {}
  counter = 1
  phrase.split(' ').each do |word|
    if !word_count_hash.include?(word.chars.count)
      word_count_hash[word.chars.count] = 1
    else
      counter += 1
      word_count_hash[word.chars.count] = counter
    end
  end
  word_count_hash
end

p word_sizes('hi al me the')
