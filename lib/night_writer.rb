require_relative 'reader'
require_relative 'encoder'
# Read the incoming message file to decode, and save the contents
# to a variable
reader    = File.open(ARGV[0], 'r')
data      = File.read(reader).chomp

# Take the contents and encode to braille pairs for formatting
# then take the pairs and save them to a variable to pass in to
# formatter, then take the braille pairs from encoder and pass them into the
encoder   = Encoder.new(data)
encoder.format_braille_grid

# Now we open a new file to write to.
# We then assign formatters rows to variables
# We then loop based upon the length of one row
# and we put a new line each iteration through, using the count
# as the index for each top, middle, and bottom
# then plus the count
new_file  = File.open(ARGV[1], 'w')
top       = encoder.top
bottom    = encoder.bottom
middle    = encoder.middle
count = 0

top.length.times do
  new_file.puts(top[count])
  new_file.puts(middle[count])
  new_file.puts(bottom[count])
  count += 1
end
