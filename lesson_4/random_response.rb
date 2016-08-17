require "strscan"

scanner = StringScanner.new("There are many new characters in the new book.")

p scanner.pos

p scanner.scan(/There/)

p scanner.pos

response = ['yes', 'no', 'maybe']

select = rand(0..2)

p response[select]
