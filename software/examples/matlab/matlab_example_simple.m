function matlab_example_simple()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletIndustrialDigitalIn4;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change to your UID

    ipcon = IPConnection(); % Create IP connection
    idi4 = BrickletIndustrialDigitalIn4(UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current value as bitmask
    valueMask = idi4.getValue();
    fprintf('Value Mask: %s\n', dec2bin(valueMask));

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end
