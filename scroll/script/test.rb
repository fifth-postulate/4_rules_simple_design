require 'launchpad/device'

def to_hash(letter)
  case letter
  when "*"
    { :red => :high }
  else
    { }
  end
end

def to_light_pattern(base_pattern)
  base_pattern.prepend(".....")
  base_pattern
    .map { |word| word + "..." }
    .map { |word| word.split('') }
    .flatten()
    .map { |letter| to_hash(letter) }
end

base_pattern = [
  '.....',
  '****.',
  '*...*',
  '****.',
  '*...*',
  '*...*',
  '****.',
]

pattern = to_light_pattern(base_pattern)

device = Launchpad::Device.new({:device_name => "Launchpad Mini MIDI 1"})
device.test_leds
sleep 1
device.reset
sleep 1
device.change_all pattern
