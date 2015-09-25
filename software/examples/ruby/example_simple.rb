#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_industrial_digital_in_4'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'XYZ' # Change to your UID

ipcon = IPConnection.new # Create IP connection
idi4 = BrickletIndustrialDigitalIn4.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# Get current value as bitmask
value_mask = idi4.get_value
puts "Value Mask: #{'%04b' % value_mask}"

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
