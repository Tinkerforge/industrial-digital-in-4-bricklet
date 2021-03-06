var Tinkerforge = require('tinkerforge');

var HOST = 'localhost';
var PORT = 4223;
var UID = 'XYZ'; // Change XYZ to the UID of your Industrial Digital In 4 Bricklet

var ipcon = new Tinkerforge.IPConnection(); // Create IP connection
var idi4 = new Tinkerforge.BrickletIndustrialDigitalIn4(UID, ipcon); // Create device object

ipcon.connect(HOST, PORT,
    function (error) {
        console.log('Error: ' + error);
    }
); // Connect to brickd
// Don't use device before ipcon is connected

ipcon.on(Tinkerforge.IPConnection.CALLBACK_CONNECTED,
    function (connectReason) {
        // Enable interrupt on pin 0
        idi4.setInterrupt(1 << 0);
    }
);

// Register interrupt callback
idi4.on(Tinkerforge.BrickletIndustrialDigitalIn4.CALLBACK_INTERRUPT,
    // Callback function for interrupt callback
    function (interruptMask, valueMask) {
        console.log('Interrupt Mask: ' + interruptMask.toString(2));
        console.log('Value Mask: ' + valueMask.toString(2));
        console.log();
    }
);

console.log('Press key to exit');
process.stdin.on('data',
    function (data) {
        ipcon.disconnect();
        process.exit(0);
    }
);
