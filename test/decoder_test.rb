require "minitest/autorun"
require "minitest/pride"
require "./lib/decoder.rb"
require "./lib/dictionary"

class DecoderTest < Minitest::Test

  def test_decoder_is_initialized
    reader = File.open('braille.txt', 'r')
    data = reader.readlines
    decoder = Decoder.new(data)

    assert_instance_of Decoder, decoder
  end

  def test_rows_have_correct_variables
    reader = File.open('braille.txt', 'r')
    data = reader.readlines
    decoder = Decoder.new(data)
    decoder.split_data_to_corresponding_rows

    assert_equal 19, decoder.top.count
    assert_equal 19, decoder.middle.count
    assert_equal 19, decoder.bottom.count
  end

  def test_lines_are_joined
    reader = File.open('braille.txt', 'r')
    data = reader.readlines
    decoder = Decoder.new(data)
    decoder.split_data_to_corresponding_rows
    decoder.join_lines

    assert_instance_of String, decoder.top
    assert_instance_of String, decoder.middle
    assert_instance_of String, decoder.bottom
  end

  def test_braille_pairs_are_created
    reader = File.open('braille.txt', 'r')
    data = reader.readlines
    decoder = Decoder.new(data)
    decoder.split_data_to_corresponding_rows
    decoder.join_lines
    decoder.create_braille_pairs

    assert_equal 1503, decoder.top.count
    assert_equal 1503, decoder.middle.count
    assert_equal 1503, decoder.bottom.count
  end

  def test_total_contains_braille_characters
    reader = File.open('braille.txt', 'r')
    data = reader.readlines
    decoder = Decoder.new(data)
    decoder.split_data_to_corresponding_rows
    decoder.join_lines
    decoder.create_braille_pairs
    decoder.create_total_array_of_braille_characters

    assert_equal 1503, decoder.total.count
  end

  def test_total_is_now_an_array_of_chars
    reader = File.open('braille.txt', 'r')
    data = reader.readlines
    decoder = Decoder.new(data)
    decoder.split_data_to_corresponding_rows
    decoder.join_lines
    decoder.create_braille_pairs
    decoder.create_total_array_of_braille_characters
    decoder.check_for_character_values

    assert_instance_of String, decoder.total[0]
    assert_equal 1503, decoder.total.count
  end

  def test_total_is_now_a_string
    reader = File.open('braille.txt', 'r')
    data = reader.readlines
    decoder = Decoder.new(data)
    decoder.split_data_to_corresponding_rows
    decoder.join_lines
    decoder.create_braille_pairs
    decoder.create_total_array_of_braille_characters
    decoder.check_for_character_values
    decoder.english_translation

    assert_equal 1503, decoder.total.length
    assert_instance_of String, decoder.total
  end 

end
