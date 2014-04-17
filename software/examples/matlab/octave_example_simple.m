function octave_example_simple
    more off;
    
    HOST = "localhost";
    PORT = 4223;
    UID = "hrg"; % Change to your UID

    ipcon = java_new("com.tinkerforge.IPConnection"); % Create IP connection
    idi4 = java_new("com.tinkerforge.BrickletIndustrialDigitalIn4", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don"t use device before ipcon is connected

    % Read out values as bitmask
    value = idi4.getValue();
    fprintf("Value: %s\n", dec2bin(value));
    
    input("Press any key to exit...\n", "s");
    ipcon.disconnect();
end
