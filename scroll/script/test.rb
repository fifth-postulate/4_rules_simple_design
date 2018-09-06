require 'launchpad/device'

device = Launchpad::Device.new({:device_name => "Launchpad Mini MIDI 1"})
device.test_leds
sleep 1
device.reset
sleep 1
device.change :grid, :x => 4, :y => 4, :red => :high, :green => :low
