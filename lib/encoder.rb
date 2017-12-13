require_relative 'dictionary'
require_relative 'reader'

class Encoder

  attr_reader :data, :alphabet

  def initialize(data, alphabet = Dictionary::LETTERS_DICT)
    @data = data
    @alphabet = alphabet
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

end
