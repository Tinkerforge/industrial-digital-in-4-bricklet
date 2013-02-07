#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_industrial_digital_in_4'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'xyz' # Change to your UID

ipcon = IPConnection.new # Create IP connection
idi4 = BrickletIndustrialDigitalIn4.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# Read out values as bitmask
value = idi4.get_value
puts "Value: #{value}"

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
