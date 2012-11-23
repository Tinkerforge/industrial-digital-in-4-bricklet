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
    ipcon = IPConnection(HOST, PORT) # Create IP connection to brickd

    idi4 = IndustrialDigitalIn4(UID) # Create device object
    ipcon.add_device(idi4) # Add device to IP connection
    # Don't use device before it is added to a connection

    # Register callback for interrupts
    idi4.register_callback(idi4.CALLBACK_INTERRUPT, cb_interrupt)

    # Enable interrupt on pin 0
    idi4.set_interrupt(1 << 0)

    raw_input('Press key to exit\n') # Use input() in Python 3
    ipcon.destroy()
