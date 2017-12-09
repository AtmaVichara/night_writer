class Writer

  attr_reader :data, :file

  def initialize(data, file = ARGV[1])
    @data = data
    @file = file
  end

  def write_to_file(data)
    File.new(@file, 'w') { |new_file| new_file.puts data }
  end
end
