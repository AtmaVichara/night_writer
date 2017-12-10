require_relative 'writer'
require_relative 'reader'

class NightWriter

  def file_data
    reader = Reader.new(ARGV[0])
    reader.read_file
  end

end
