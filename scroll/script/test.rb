require 'launchpad/device'

def to_hash(letter)
  case letter
  when "*"
    { :red => :high }
  else
    { }
  end
end

base_pattern = [
  "*..*..*.",
  ".*..*..*",
  "..*..*..",
  "*..*..*.",
  ".*..*..*",
  "..*..*..",
  "*..*..*.",
  ".*..*..*",
]

pattern = base_pattern
            .map { |word| word.split('') }
            .flatten()
            .map { |letter| to_hash(letter) }

device = Launchpad::Device.new({:device_name => "Launchpad Mini MIDI 1"})
device.test_leds
sleep 1
device.reset
sleep 1
device.change_all pattern
