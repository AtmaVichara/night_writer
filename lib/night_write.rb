require_relative 'writer'
require_relative 'reader'
require_relative 'formatter'
require_relative 'encoder'

count = 0

# Read the incoming message file to decode, and save the contents
# to a variable
reader    = Reader.new(ARGV[0])
data      = reader.read_file

# Take the contents and encode to braille pairs for formatting
# then take the pairs and save them to a variable to pass in to
# formatter.
encoder   = Encoder.new(data)
encoded   = encoder.braille_pairs

# Take the braille pairs from encoder and pass them into the
# Formatter object, then format the
formatter = Formatter.new(encoded)
formatter.format_braille_grid


# Now we open a new file to write to.
# We then assign formatters rows to variables
# We then loop based upon the length of one row
# and we put a new line each iteration through, using the count
# as the index for each top, middle, and bottom
# then plus the count
new_file  = File.open(ARGV[1], 'w')
top       = formatter.top
bottom    = formatter.bottom
middle    = formatter.middle
top.length.times do
  new_file.puts(top[count])
  new_file.puts(middle[count])
  new_file.puts(bottom[count])
  count += 1
end
