<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletIndustrialDigitalIn4.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletIndustrialDigitalIn4;

$host = 'localhost';
$port = 4223;
$uid = 'xyz'; // Change to your UID

// Callback function for interrupts
function cb_interrupt($interruptMask, $valueMask)
{
    echo "Interrupt by: " . decbin($interruptMask) . "\n";
    echo "Value: " . decbin($valueMask) . "\n";
}

$ipcon = new IPConnection($host, $port); // Create IP connection to brickd
$idi4 = new BrickletIndustrialDigitalIn4($uid); // Create device object

$ipcon->addDevice($idi4); // Add device to IP connection
// Don't use device before it is added to a connection

// Register callback for interrupts
$idi4->registerCallback(BrickletIndustrialDigitalIn4::CALLBACK_INTERRUPT, 'cb_interrupt');

// Enable interrupt on pin 0
$idi4->setInterrupt(1 << 0);

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
