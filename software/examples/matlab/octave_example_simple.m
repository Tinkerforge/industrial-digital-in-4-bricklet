function octave_example_simple()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your Industrial Digital In 4 Bricklet

    ipcon = java_new("com.tinkerforge.IPConnection"); % Create IP connection
    idi4 = java_new("com.tinkerforge.BrickletIndustrialDigitalIn4", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current value as bitmask
    valueMask = idi4.getValue();
    fprintf("Value Mask: %s\n", dec2bin(valueMask));

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end
