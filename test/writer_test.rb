require "minitest/autorun"
require "minitest/pride"
require "./lib/formatter"
require "./lib/writer"

class WriterTest < Minitest::Test

  def data
    @data
  end

  def setup
    reader = Reader.new('message.txt')
    encoder = Encoder.new(reader.read_file)
    formatter = Formatter.new(encoder.braille_pairs)
    formatter.format_braille_grid
    formatter.complete_grid
    @data = formatter.total
  end

  def test_writer_initializes_as_writer_object
    writer = Writer.new('braille.txt', data)

    assert_instance_of Writer, writer
  end



end
