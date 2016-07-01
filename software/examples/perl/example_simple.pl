#!/usr/bin/perl

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletIndustrialDigitalIn4;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Industrial Digital In 4 Bricklet

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $idi4 = Tinkerforge::BrickletIndustrialDigitalIn4->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Get current value as bitmask
my $value_mask = $idi4->get_value();
print "Value Mask: " . sprintf('%04b', $value_mask) . "\n";

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
