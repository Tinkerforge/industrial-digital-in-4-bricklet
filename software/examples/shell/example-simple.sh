#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change to your UID

# Get current value as bitmask
tinkerforge call industrial-digital-in-4-bricklet $uid get-value
