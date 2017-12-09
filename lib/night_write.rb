require_relative 'file_reader'

class NightWriter
  attr_reader = :reader

  def initialize()
    @reader = FileReader.new
  end

  def encode_file_to_braille
    file_contents = reader
    braille = encode_to_braille(file_contents)
  end

  def encode_to_braille(file_contents)
    
  end
end
