
class FileReader
  attr_reader :filename

  def initialize(filename = ARGV[0])
    @filename = filename
  end

  def open_file
    return @filename.open(filename, 'r')
  end

  def reader
    return File.read(open_file)
  end
end
