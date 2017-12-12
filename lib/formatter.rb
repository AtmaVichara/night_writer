require_relative 'encoder'

class Formatter

  attr_reader :top, :middle, :bottom, :data, :total

  def initialize(data)
    @data = data
    @top = []
    @middle = []
    @bottom = []
    @total = []
  end
  #
  # def starting_element(element)
  #   Proc.new { |nth| @data.drop(element).each_slice(3).map(&:first)}
  # end

  def format_braille_grid
    @top << @data.each_slice(3).map(&:first)
    @middle << @data.drop(1).each_slice(3).map(&:first)
    @bottom << @data.drop(2).each_slice(3).map(&:first)
  end

  def complete_grid
    @total << @top.join << @middle.join << @bottom.join
  end

end
