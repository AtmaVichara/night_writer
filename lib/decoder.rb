require_relative 'dictionary'

class Decoder

  attr_reader :data, :top, :middle, :bottom, :alphabet, :total

  def initialize(data, alphabet = Dictionary::LETTERS_DICT)
    @data = data
    @alphabet = alphabet.invert
    @top = []
    @middle = []
    @bottom = []
    @total = []
  end

  def split_data_to_corresponding_rows
    @top << data.each_slice(3).map(&:first)
    @middle << data.drop(1).each_slice(3).map(&:first)
    @bottom << data.drop(2).each_slice(3).map(&:first)

    @top.flatten!
    @middle.flatten!
    @bottom.flatten!
  end

  def remove_new_line_return
    @top = @top.map { |line| line.chomp }
    @middle = @middle.map { |line| line.chomp }
    @bottom = @bottom.map { |line| line.chomp }

    @top    = @top.join
    @middle = @middle.join
    @bottom = @bottom.join
  end

  def create_braille_pairs
    top_pairs = @top.split('').each_slice(2).to_a
    middle_pairs = @middle.split('').each_slice(2).to_a
    bottom_pairs = @bottom.split('').each_slice(2).to_a

    @top = top_pairs.map { |pairs| pairs.join }
    @middle = middle_pairs.map { |pairs| pairs.join }
    @bottom = bottom_pairs.map { |pairs| pairs.join }
  end

  def create_total_array_of_braille_characters
    counter = 0
    @top.length.times do
      @total << @top[counter] + @middle[counter] + @bottom[counter]
      counter += 1
    end
  end

  def check_for_character_values
    @total = @total.map do |braille_letter|
      alphabet.key?(braille_letter) ? alphabet[braille_letter] : " "
    end
  end

  def english_translation
    @total = @total.join
  end
end
