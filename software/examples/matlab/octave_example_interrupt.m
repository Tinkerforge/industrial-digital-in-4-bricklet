function octave_example_interrupt
    more off;
    
    HOST = "localhost";
    PORT = 4223;
    UID = "hrg"; % Change to your UID

    ipcon = java_new("com.tinkerforge.IPConnection"); % Create IP connection
    idi4 = java_new("com.tinkerforge.BrickletIndustrialDigitalIn4", UID, ipcon); % Create device object
    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don"t use device before ipcon is connected

    % Register callback for interrupts
    idi4.addInterruptCallback(@cb_interrupt);
    
    % Enable interrupt on pin 0
    idi4.setInterrupt(bitshift(1, 0));
    
    input("Press any key to exit...\n", "s");
    ipcon.disconnect();
end

% Callback function for interrupts
function cb_interrupt(e)
    fprintf("Interrupt by: %s\n", dec2bin(e.interruptMask));
    fprintf("Value: %s\n", dec2bin(e.valueMask));
end
