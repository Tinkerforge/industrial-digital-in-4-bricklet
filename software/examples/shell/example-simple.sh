#!/bin/sh
# connects to localhost:4223 by default, use --host and --port to change it

# change to your UID
uid=XYZ

# get current input status
tinkerforge call industrial-digital-in-4-bricklet $uid get-value
