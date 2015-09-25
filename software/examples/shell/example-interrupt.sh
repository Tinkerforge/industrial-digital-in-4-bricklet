#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change to your UID

# Handle incoming interrupt callbacks
tinkerforge dispatch industrial-digital-in-4-bricklet $uid interrupt &

# Enable interrupt on pin 0: 1 << 0 = 1
tinkerforge call industrial-digital-in-4-bricklet $uid set-interrupt 1

echo "Press key to exit"; read dummy

kill -- -$$ # Stop callback dispatch in background
