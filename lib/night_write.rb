require_relative 'writer'
require_relative 'reader'
require_relative 'formatter'
require_relative 'encoder'

class NightWriter

  attr_reader :file, :write_file

  def initialize(file = ARGV[0], write_file = ARGV[1])
    @file = file
    @write_file = write_file
  end

  def file_data
    reader = Reader.new(@file)
    reader.read_file
  end

  def encode_data_to_braille_pairs
    encoder = Encoder.new(file_data)
    encoder.braille_pairs
  end

  def format_for_writing
    formatter = Formatter.new(encode_data_to_braille_pairs)
    formatter.format_braille_grid
    formatter.complete_grid
    formatter.total
  end

  def write_data
    writer = Writer.new(ARGV[1], format_for_writing)
  end

end
