#!/usr/bin/perl  

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletIndustrialDigitalIn4;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'hsD'; # Change to your UID

my $ipcon = IPConnection->new(); # Create IP connection
my $idi4 = BrickletIndustrialDigitalIn4->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Read out values as bitmask
print "\nValue: ".sprintf("%b", $idi4->get_value());

print "\nPress any key to exit...\n";
<STDIN>;
$ipcon->disconnect();