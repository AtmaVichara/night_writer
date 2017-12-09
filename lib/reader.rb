
class Reader
  attr_reader :filename

  def initialize(filename = ARGV[0])
    @filename = filename
  end

  def open_file
    return File.open(@filename, 'r')
  end

  def read_file
    return File.read(open_file).chomp
  end
end
