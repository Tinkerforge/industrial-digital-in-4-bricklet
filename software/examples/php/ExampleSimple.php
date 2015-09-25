<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletIndustrialDigitalIn4.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletIndustrialDigitalIn4;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change to your UID

$ipcon = new IPConnection(); // Create IP connection
$idi4 = new BrickletIndustrialDigitalIn4(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Get current value as bitmask
$value_mask = $idi4->getValue();
echo "Value Mask: " . sprintf("%04b", $value_mask) . "\n";

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));
$ipcon->disconnect();

?>
