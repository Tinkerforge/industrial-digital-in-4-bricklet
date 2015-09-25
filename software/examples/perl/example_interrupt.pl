#!/usr/bin/perl

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletIndustrialDigitalIn4;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change to your UID

# Callback subroutine for interrupt callback
sub cb_interrupt
{
    my ($interrupt_mask, $value_mask) = @_;

    print "Interrupt Mask: " . sprintf('%04b', $interrupt_mask) . "\n";
    print "Value Mask: " . sprintf('%04b', $value_mask) . "\n";
    print "\n";
}

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $idi4 = Tinkerforge::BrickletIndustrialDigitalIn4->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Register interrupt callback to subroutine cb_interrupt
$idi4->register_callback($idi4->CALLBACK_INTERRUPT, 'cb_interrupt');

# Enable interrupt on pin 0
$idi4->set_interrupt(1 << 0);

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
