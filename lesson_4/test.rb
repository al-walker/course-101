# TTT Bonus feature 1

def joinor(array, delimiter = ', ', last_delimiter = 'or')
  if array.size == 2
    p "#{array[0]} #{last_delimiter} #{array[1]}"
  elsif array.size > 1
    p "#{array[0...-1].join(delimiter)}#{delimiter}#{last_delimiter} #{array[-1]}"
  else
    p "#{array[0]}"
  end
end

joinor([1, 2, 3])                # => "1, 2, or 3"
joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
joinor([1, 2])
joinor([1])

# for study purposes to compare my solution
# def joinor(arr, delimiter=', ', word='or')
#   arr[-1] = "#{word} #{arr.last}" if arr.size > 1
#   arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
# end
