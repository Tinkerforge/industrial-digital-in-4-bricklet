<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletIndustrialDigitalIn4.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletIndustrialDigitalIn4;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change to your UID

// Callback function for interrupt callback
function cb_interrupt($interrupt_mask, $value_mask)
{
    echo "Interrupt Mask: " . sprintf("%04b", $interrupt_mask) . "\n";
    echo "Value Mask: " . sprintf("%04b", $value_mask) . "\n";
    echo "\n";
}

$ipcon = new IPConnection(); // Create IP connection
$idi4 = new BrickletIndustrialDigitalIn4(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Register interrupt callback to function cb_interrupt
$idi4->registerCallback(BrickletIndustrialDigitalIn4::CALLBACK_INTERRUPT, 'cb_interrupt');

// Enable interrupt on pin 0
$idi4->setInterrupt(1 << 0);

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
