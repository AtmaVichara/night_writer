require_relative 'dictionary'
require_relative 'reader'

class Encoder

  attr_reader :data, :alphabet

  def initialize(data = Reader.new(ARGV[0]), alphabet = Dictionary::LETTERS_DICT)
    @data = data
    @alphabet = alphabet
  end

  def file_data
    @data.read_file
  end

  def split_file_data
    return file_data.split('')
  end

  def check_for_braille_value
    return split_file_data.map do |char|
      @alphabet.key?(char.downcase) ? @alphabet[char.downcase] : "......"
    end
  end

  def split_braille_chars
    return check_for_braille_value.join.split('')
  end

  def braille_pairs
    braille_pairs = []
    split_braille_chars.each_slice(2) { |pairs| braille_pairs << pairs}
    return braille_pairs.map { |pairs| pairs.join }
  end

  def encode_file_to_braille
    file_contents = reader
    braille = encode_to_braille(file_contents)
  end

end
