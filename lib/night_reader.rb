require_relative 'decoder'

reader = File.open(ARGV[0], 'r')
reader = reader.readlines

decoder = Decoder.new(reader)

decoder.split_data_to_corresponding_rows
decoder.remove_new_line_return
decoder.create_braille_pairs
decoder.create_total_array_of_braille_characters
decoder.check_for_character_values
decoder.english_translation

translation = decoder.total

new_file = File.open(ARGV[1], 'w')
new_file.write(translation)
