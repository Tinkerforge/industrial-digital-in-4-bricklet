<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletIndustrialDigitalIn4.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletIndustrialDigitalIn4;

$host = 'localhost';
$port = 4223;
$uid = 'xyz'; // Change to your UID

$ipcon = new IPConnection($host, $port); // Create IP connection to brickd
$idi4 = new BrickletIndustrialDigitalIn4($uid); // Create device object

$ipcon->addDevice($idi4); // Add device to IP connection
// Don't use device before it is added to a connection

// Read out values as bitmask
$value = $idi4->getValue();
echo "Value: $value\n";

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));
$ipcon->destroy();

?>
