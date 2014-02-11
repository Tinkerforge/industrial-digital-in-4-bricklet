var IPConnection = require('Tinkerforge/IPConnection');
var BrickletIndustrialDigitalIn4 = require('Tinkerforge/BrickletIndustrialDigitalIn4');

var HOST = 'localhost';
var PORT = 4223;
var UID = 'hxF';// Change to your UID

var ipcon = new IPConnection();// Create IP connection
var idi4 = new BrickletIndustrialDigitalIn4(UID, ipcon);// Create device object

ipcon.connect(HOST, PORT,
    function(error) {
        if(error === IPConnection.ERROR_ALREADY_CONNECTED) {
            console.log('Error: Already connected');        
        }
    }
);// Connect to brickd

// Don't use device before ipcon is connected
ipcon.on(IPConnection.CALLBACK_CONNECTED,
    function(connectReason) {
        // Enable interrupt on pin 0
        idi4.setInterrupt(1 << 0);     
    }
);

// Register callback for interrupts
idi4.on(BrickletIndustrialDigitalIn4.CALLBACK_INTERRUPT,
    // Callback function for interrupts
    function(interruptMask, valueMask) {
        console.log('Interrupt by: '+parseInt(interruptMask).toString(2));
        console.log('Value: '+parseInt(valueMask).toString(2));
    }
);

console.log("Press any key to exit ...");
process.stdin.on('data', function(data) {
	    ipcon.disconnect(
            function(error) {
                if(error === IPConnection.ERROR_NOT_CONNECTED) {
                    console.log('Error: Not connected');        
                }
            }
        );
process.exit(0);
});

