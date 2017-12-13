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

  def format_braille_grid

    # Grabbing each pairs by the nth (3rd) element and
    # assigning it to its corresponding line in the grid
    @top << @data.each_slice(3).map(&:first)
    @middle << @data.drop(1).each_slice(3).map(&:first)
    @bottom << @data.drop(2).each_slice(3).map(&:first)

    # Flatten away one level of the array, and grab every
    # 40 pairs, then turn back into an array, and store to variable
    top1 = @top.flatten(1).each_slice(40).to_a
    mid1 = @middle.flatten(1).each_slice(40).to_a
    bottom1 = @bottom.flatten(1).each_slice(40).to_a

    # Iterating over the arrays and joining the elements together
    # creating an array of strings for each level in the grid
    # and assigning that back into the instance variables.
    @top = top1.map { |line| line.join }
    @middle = mid1.map { |line| line.join }
    @bottom = bottom1.map { |line| line.join }

  end

end
