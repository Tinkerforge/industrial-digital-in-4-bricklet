#!/usr/bin/perl  

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletIndustrialDigitalIn4;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'hsD'; # Change to your UID

# Callback function for interrupts
sub cb_interrupt
{
    my ($interrupt_mask, $value_mask) = @_;

    print "Interrupt by: ".sprintf('%b', $interrupt_mask)."\n";
    print "Value: ".sprintf('%b', $value_mask)."\n";
}

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $idi4 = Tinkerforge::BrickletIndustrialDigitalIn4->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Register callback for interrupts
$idi4->register_callback($idi4->CALLBACK_INTERRUPT, 'cb_interrupt');

# Enable interrupt on pin 0
$idi4->set_interrupt(1 << 0);

print "Press any key to exit...\n";
<STDIN>;
$ipcon->disconnect();
