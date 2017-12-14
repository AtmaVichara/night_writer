require './lib/night_writer'
require 'minitest/autorun'
require 'minitest/pride'


class NightWriteTest < Minitest::Test

  def test_night_write_is_initialized
    skip
    night_write = NightWriter.new

    assert_instance_of NightWriter, night_write
  end

  def test_file_data_reads_file
    night_write = NightWriter.new('message.txt')

    assert_equal "hello world", night_write.file_data
  end

  def test_encoder_encodes_braille_pairs
    night_write = NightWriter.new('message.txt')



    assert_equal ["0.", "00", "..", "0.", ".0", "..", "0.", "0.", "0.", "0.", "0.", "0.",
                  "0.", ".0", "0.", "..", "..", "..", ".0", "00", ".0", "0.", ".0", "0.",
                  "0.", "00", "0.", "0.", "0.", "0.", "00", ".0", ".."],
                  night_write.encode_data_to_braille_pairs
  end

  def test_write_data_writes_to_new_file
    night_write = NightWriter.new('message.txt', 'braille.txt')


    require 'pry'; binding.pry
    assert_equal
  end
end
