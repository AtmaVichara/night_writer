require "minitest/autorun"
require "minitest/pride"
require "./lib/formatter.rb"
require "./lib/encoder.rb"
require "./lib/dictionary.rb"
require "./lib/reader.rb"


class FormatterTest < Minitest::Test
  attr_reader :data

  def data
    @data
  end

  def setup
    reader = Reader.new('message.txt')
    encoder = Encoder.new(reader.read_file)
    @data = encoder.braille_pairs
  end

  def test_formatter_instantiates_data
    formatter = Formatter.new(data)

    assert_instance_of Formatter, formatter
  end

  def test_top_contains_top_elements_of_braille
    formatter = Formatter.new(data)
    formatter.format_braille_grid

    assert_equal [["0.", "0.", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", "00"]],
    formatter.top
  end

  def test_middle_contains_middle_elements_of_braille
    formatter = Formatter.new(data)
    formatter.format_braille_grid

    assert_equal [["00", ".0", "0.", "0.", ".0", "..", "00", ".0", "00", "0.", ".0"]],
    formatter.middle
  end

  def test_bottom_contains_bottom_elements_of_braille
    formatter = Formatter.new(data)
    formatter.format_braille_grid

    assert_equal [["..", "..", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", ".."]],
    formatter.bottom
  end

  def test_complete_grid_returns_correct_values
    formatter = Formatter.new(data)
    formatter.format_braille_grid
    formatter.complete_grid

    assert_equal ['0.0.0.0.0....00.0.0.00', '00.00.0..0..00.0000..0', '....0.0.0....00.0.0...'],
    formatter.total
  end

end
