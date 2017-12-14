require "minitest/autorun"
require "minitest/pride"
require "./lib/encoder.rb"
require "./lib/dictionary.rb"

class EncoderTest < Minitest::Test

  attr_reader :data

  def setup
    open_file = File.open('message.txt', 'r')
    @data = File.read(open_file).chomp
  end

  def test_data_is_initialized
    file_contents = Encoder.new(data)

    assert_instance_of Encoder, file_contents
  end

  def test_encoder_has_contents_of_file
    file_contents = Encoder.new(data)

    assert_equal data, file_contents.data
  end

  def test_alphabet_is_initialized_with_dictionary
    file_contents = Encoder.new(data)

    assert_equal Dictionary::LETTERS_DICT, file_contents.alphabet
  end

  def test_encoder_splits_file_data
    file_contents = Encoder.new(data)

    assert_equal data.split(''),
    file_contents.split_file_data
  end

  def test_check_for_braille_value_returns_array_of_braille
    file_contents = Encoder.new(data)

    assert_equal 26, file_contents.check_for_braille_value.count
  end

  def test_split_braille_chars_returns_array_of_braille_chars
    file_contents = Encoder.new(data)

    assert_equal 156, file_contents.split_braille_chars.count
   end

   def test_braille_pairs_returns_array_of_braille_pairs
    file_contents = Encoder.new(data)

    assert_equal 78, file_contents.braille_pairs.count
   end

   def test_encoder_formats_braille_pairs_into_corresponding_levels
     file_contents = Encoder.new(data)
     file_contents.format_braille_grid

     assert_equal 1, file_contents.top.count
     assert_equal 1, file_contents.middle.count
     assert_equal 1, file_contents.bottom.count
   end

   def test_grid_values_have_correct_length
     file_contents = Encoder.new(data)
     file_contents.format_braille_grid

     assert_equal 52, file_contents.top[0].length
     assert_equal 52, file_contents.middle[0].length
     assert_equal 52, file_contents.bottom[0].length
   end

end
