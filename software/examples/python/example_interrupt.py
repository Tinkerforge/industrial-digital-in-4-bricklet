#!/usr/bin/env python
# -*- coding: utf-8 -*-  

HOST = "localhost"
PORT = 4223
UID = "xyz" # Change to your UID

from tinkerforge.ip_connection import IPConnection
from tinkerforge.bricklet_industrial_digital_in_4 import IndustrialDigitalIn4

# Callback function for interrupts
def cb_interrupt(interrupt_mask, value_mask):
    print('Interrupt by: ' + str(bin(interrupt_mask)))
    print('Value: ' + str(bin(value_mask)))

if __name__ == "__main__":
    ipcon = IPConnection() # Create IP connection
    idi4 = IndustrialDigitalIn4(UID, ipcon) # Create device object

    ipcon.connect(HOST, PORT) # Connect to brickd
    # Don't use device before ipcon is connected

    # Register callback for interrupts
    idi4.register_callback(idi4.CALLBACK_INTERRUPT, cb_interrupt)

    # Enable interrupt on pin 0
    idi4.set_interrupt(1 << 0)

    raw_input('Press key to exit\n') # Use input() in Python 3
    ipcon.disconnect()
