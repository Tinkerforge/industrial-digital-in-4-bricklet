#!/usr/bin/env python
# -*- coding: utf-8 -*-  

HOST = "localhost"
PORT = 4223
UID = "xyz" # Change to your UID

import time

from tinkerforge.ip_connection import IPConnection
from tinkerforge.bricklet_industrial_digital_in_4 import IndustrialDigitalIn4

if __name__ == "__main__":
    ipcon = IPConnection() # Create IP connection
    idi4 = IndustrialDigitalIn4(UID, ipcon) # Create device object

    ipcon.connect(HOST, PORT) # Connect to brickd
    # Don't use device before ipcon is connected

    # Read out values as bitmask
    value = idi4.get_value()
    print('Value: ' + str(bin(value)))

    raw_input('Press key to exit\n') # Use input() in Python 3
    ipcon.disconnect()
