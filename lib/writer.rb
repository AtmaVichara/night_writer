require_relative 'encoder'
require_relative 'night_write'
require_relative 'formatter'

class Writer

  attr_reader :data, :file

  def initialize(file, data)
    @data = data
    @file = file
  end

  def write_braille
    new_file = File.open(@file, 'w')
    new_file.write(@data[0] + "\n")
    new_file.write(@data[1] + "\n")
    new_file.write(@data[2] + "\n")
  end
end
