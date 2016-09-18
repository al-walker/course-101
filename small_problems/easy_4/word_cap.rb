def word_cap(string)
  new_string = []
 string.split.each do |s|
   new_string << s.capitalize
 end
new_string.join(' ')
end


p word_cap('four score and seven')
p word_cap('the javascript language')
p word_cap('this is a "quoted" word')
