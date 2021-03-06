def slice(width)
  SliceBuilder.new(width)
end

class SliceBuilder
  def initialize(width)
    @width = width
  end

  def of(pattern)
    Slice.new(@width, pattern)
  end
end

class Slice
  def initialize(width, pattern)
    @width = width
    @pattern = pattern
  end

  def full_slice_from?(index)
    index + @width < @pattern[0].length
  end

  def at(index)
    @pattern.map { |row| row[index..(index + @width-1)] }
  end
end
