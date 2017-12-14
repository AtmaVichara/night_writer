require_relative 'decoder'

reader = File.open(ARGV[0], 'r')
data = reader.readlines

decoder = Decoder.new(data)

decoder.split_data_to_corresponding_rows
decoder.join_lines
decoder.create_braille_pairs
decoder.create_total_array_of_braille_characters
decoder.check_for_character_values
decoder.english_translation

translation = decoder.total

new_file = File.open(ARGV[1], 'w')
new_file.write(translation)

reader.close
