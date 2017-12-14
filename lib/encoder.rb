require_relative 'dictionary'

class Encoder

  attr_reader :data, :alphabet, :top, :middle, :bottom

  def initialize(data, alphabet = Dictionary::LETTERS_DICT)
    @data = data
    @alphabet = alphabet
    @top = []
    @middle = []
    @bottom = []
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

  def format_braille_grid

    # Grabbing each pairs by the nth (3rd) element from data and
    # assigning it to its corresponding line in the grid
    @top << braille_pairs.each_slice(3).map(&:first)
    @middle << braille_pairs.drop(1).each_slice(3).map(&:first)
    @bottom << braille_pairs.drop(2).each_slice(3).map(&:first)

    # Flatten away one level of the array, and grab every
    # 40 pairs, then turn back into an array, and store to variable
    @top = @top.flatten(1).each_slice(40).to_a
    @middle = @middle.flatten(1).each_slice(40).to_a
    @bottom = @bottom.flatten(1).each_slice(40).to_a

    # Iterating over the arrays and joining the elements together
    # creating an array of strings for each level in the grid
    # and assigning that back into the instance variables.
    @top = @top.map { |line| line.join }
    @middle = @middle.map { |line| line.join }
    @bottom = @bottom.map { |line| line.join }

  end

end
