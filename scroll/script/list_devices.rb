require "portmidi"

Portmidi.start

Portmidi.input_devices.each do |dev|
  puts "%d > %s" % [dev.device_id, dev.name]
end
