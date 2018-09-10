require "convert"
require "juxtapose"
require "slice"

class Scroll
  def initialize(message)
    build = PatternBuilder.new()
    pattern = build.from(message)
    @width = 8
    @pattern = slice(@width).of(pattern)
    @index = 0
  end

  def reset
    @index = 0
  end

  def advance
    @index += 1
  end

  def show?
    @pattern.full_slice_from?(@index)
  end

  def show_on(receiver)
    slice = @pattern.at(@index)
    receiver.show(slice)
  end
end

class PatternBuilder
  def initialize
    @convert = Convert.new
    @juxtapose = Juxtapose.new
  end

  def from(message)
    message
      .upcase
      .split('')
      .map { |a_letter| @convert.letter(a_letter) }
      .inject { |accumulator, a_letter| @juxtapose.these(accumulator, a_letter) }
  end
end
