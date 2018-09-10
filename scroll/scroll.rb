require 'launchpad/device'
require "scroll"
require "pad"

device = Launchpad::Device.new({:device_name => "Launchpad Mini MIDI 1"})
pad = Pad.new(device)
scroll = Scroll.new("hello world")

while true
  while scroll.show? do
    scroll.show_on(pad)
    sleep 0.1
    scroll.advance
  end
  scroll.reset
end
