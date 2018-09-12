require 'launchpad/device'
require "scroll"
require "pad"

message = "  " + ARGV[0] + "  "

device = Launchpad::Device.new({:device_name => "Launchpad Mini MIDI 1"})
pad = Pad.new(device)
scroll = Scroll.new(message)

begin
  while true
    while scroll.show? do
      scroll.show_on(pad)
      sleep 0.1
      scroll.advance
    end
    scroll.reset
  end
rescue Interrupt
  device.reset
end
