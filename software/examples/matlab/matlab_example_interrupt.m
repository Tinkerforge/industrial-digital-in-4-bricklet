function matlab_example_callback()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletIndustrialDigitalIn4;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'hrg'; % Change to your UID
    
    ipcon = IPConnection(); % Create IP connection
    idi4 = BrickletIndustrialDigitalIn4(UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Register callback for interrupts
    set(idi4, 'InterruptCallback', @(h, e) cb_interrupt(e));

    % Enable interrupt on pin 0
    idi4.setInterrupt(bitshift(1, 0));
    
    input('Press any key to exit...\n', 's');
    ipcon.disconnect();
end

% Callback function for interrupts
function cb_interrupt(e)
    fprintf('Interrupt by: %s\n', dec2bin(e.interruptMask));
    fprintf('Value: %s\n', dec2bin(e.valueMask));
end
