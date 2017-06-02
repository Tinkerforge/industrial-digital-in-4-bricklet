function octave_example_interrupt()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your Industrial Digital In 4 Bricklet

    ipcon = javaObject("com.tinkerforge.IPConnection"); % Create IP connection
    idi4 = javaObject("com.tinkerforge.BrickletIndustrialDigitalIn4", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Register interrupt callback to function cb_interrupt
    idi4.addInterruptCallback(@cb_interrupt);

    % Enable interrupt on pin 0
    idi4.setInterrupt(bitshift(1, 0));

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end

% Callback function for interrupt callback
function cb_interrupt(e)
    fprintf("Interrupt Mask: %s\n", dec2bin(e.interruptMask));
    fprintf("Value Mask: %s\n", dec2bin(e.valueMask));
    fprintf("\n");
end
