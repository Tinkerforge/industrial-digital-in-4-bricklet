<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletIndustrialDigitalIn4.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletIndustrialDigitalIn4;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'xyz'; // Change to your UID

// Callback function for interrupts
function cb_interrupt($interruptMask, $valueMask)
{
    echo "Interrupt by: " . decbin($interruptMask) . "\n";
    echo "Value: " . decbin($valueMask) . "\n";
}

$ipcon = new IPConnection(); // Create IP connection
$idi4 = new BrickletIndustrialDigitalIn4(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Register callback for interrupts
$idi4->registerCallback(BrickletIndustrialDigitalIn4::CALLBACK_INTERRUPT, 'cb_interrupt');

// Enable interrupt on pin 0
$idi4->setInterrupt(1 << 0);

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
