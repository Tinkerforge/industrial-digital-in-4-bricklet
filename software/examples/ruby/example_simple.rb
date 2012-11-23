#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_industrial_digital_in_4'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'xyz' # Change to your UID

ipcon = IPConnection.new HOST, PORT # Create IP connection to brickd
idi4 = BrickletIndustrialDigitalIn4.new UID # Create device object
ipcon.add_device idi4 # Add device to IP connection
# Don't use device before it is added to a connection

# Read out values as bitmask
value = idi4.get_value()
puts "Value: #{value}"

puts 'Press key to exit'
$stdin.gets
ipcon.destroy
