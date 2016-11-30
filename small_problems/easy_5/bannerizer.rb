# input
# text
# output
# text in box

# Algorithm
# print top line
# print sides
# print bottom
# assign text to variable
# interpolate text variable in box

# pseudocode
def print_in_box(text)
  line = '-'
  lines = []
  text.size.times { lines << line }
  space = ' '
  spaces = []
  text.size.times { spaces << space }
  puts "+#{lines.join}+"
  puts "|#{spaces.join}|"
  puts "|#{text}|"
  puts "|#{spaces.join}|"
  puts "+#{lines.join}+"
end
p print_in_box('To boldly go')
