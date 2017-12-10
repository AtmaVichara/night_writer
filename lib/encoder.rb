require_relative 'dictionary'
require_relative 'night_write'

class Encoder < NightWrite

  attr_reader :data, :alphabet

  def initialize(args={})
    args = args.merge(default_args)
    @data = args[:data]
    @alphabet = args[:alphabet]
  end

  def default_args
    {
      data: file_data,
      alphabet: Dictionary::LETTERS_DICT
    }
  end

  def split_file_data
    @data.split('')
  end

  def check_for_braille_value
    split_file_data.map do |char|
      @alphabet.key?(char.downcase) ? @alphabet[char.downcase] : "......"
    end
  end

  def split_braille_chars
    check_for_braille_value.join.split('')
  end

  def braille_pairs
    braille_pairs = []
    split_braille_chars.each_slice(2) { |pairs| braille_pairs << pairs}
    braille_pairs.map { |pairs| pairs.join }
  end

  def encode_file_to_braille
    file_contents = reader
    braille = encode_to_braille(file_contents)
  end

end
