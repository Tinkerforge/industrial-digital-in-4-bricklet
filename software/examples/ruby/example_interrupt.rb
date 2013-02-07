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

# Register callback for interrupts
idi4.register_callback(BrickletIndustrialDigitalIn4::CALLBACK_INTERRUPT) do |interrupt_mask, value_mask|
  puts "Interrupt by: #{interrupt_mask.to_s 2}"
  puts "Value: #{value_mask.to_s 2}"
end

# Enable interrupt on pin 0
idi4.set_interrupt 1 << 0

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
