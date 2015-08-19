#!/usr/bin/perl

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletIndustrialDigitalIn4;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change to your UID

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $idi4 = Tinkerforge::BrickletIndustrialDigitalIn4->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Read out values as bitmask
my $value = $idi4->get_value();
print "Value: ".sprintf("%b", $value)."\n";

print "Press any key to exit...\n";
<STDIN>;
$ipcon->disconnect();
