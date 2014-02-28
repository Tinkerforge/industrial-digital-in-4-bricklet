var Tinkerforge = require('tinkerforge');

var HOST = 'localhost';
var PORT = 4223;
var UID = 'hxF'; // Change to your UID

var ipcon = new Tinkerforge.IPConnection(); // Create IP connection
var idi4 = new Tinkerforge.BrickletIndustrialDigitalIn4(UID, ipcon); // Create device object

ipcon.connect(HOST, PORT,
    function(error) {
        console.log('Error: '+error);
    }
); // Connect to brickd
// Don't use device before ipcon is connected

ipcon.on(Tinkerforge.IPConnection.CALLBACK_CONNECTED,
    function(connectReason) {
        // Read out values as bitmask
        idi4.getValue(
            function(value) {
                console.log('Value: '+parseInt(value).toString(2));
            },
            function(error) {
                console.log('Error: '+error);
            }
        );
    }
);

console.log("Press any key to exit ...");
process.stdin.on('data',
    function(data) {
        ipcon.disconnect();
        process.exit(0);
    }
);
