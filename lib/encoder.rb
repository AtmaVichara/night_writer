require_relative 'dictionary'
require_relative 'reader'

class Encoder 

  def initialize(data = reader)
    @data = data
  end

  def encode_file_to_braille
    file_contents = reader
    braille = encode_to_braille(file_contents)
  end

end
