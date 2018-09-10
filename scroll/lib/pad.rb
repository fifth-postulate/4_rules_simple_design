class Pad
  def initialize(device)
    @device = device
  end

  def show(base_pattern)
    pattern = to_light_pattern(base_pattern)

    @device.change_all pattern
  end
end

def to_light_pattern(base_pattern)
  base_pattern
    .map { |word| word.split('') }
    .flatten()
    .map { |letter| to_hash(letter) }
end

def to_hash(letter)
  case letter
  when "*"
    { :red => :high }
  else
    { }
  end
end


