using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "xyz"; // Change to your UID

	// Callback function for interrupts
	static void InterruptCB(ushort interruptMask, ushort valueMask)
	{
		string interruptBinary = System.Convert.ToString(interruptMask, 2);
		string valueBinary = System.Convert.ToString(valueMask, 2);

		System.Console.WriteLine("Interrupt by: " + interruptBinary);
		System.Console.WriteLine("Value: " + valueBinary);
	}

	static void Main() 
	{
		IPConnection ipcon = new IPConnection(HOST, PORT); // Create connection to brickd
		BrickletIndustrialDigitalIn4 idi4 = new BrickletIndustrialDigitalIn4(UID); // Create device object
		ipcon.AddDevice(idi4); // Add device to IP connection
		// Don't use device before it is added to a connection

		// Register callback for interrupts
		idi4.RegisterCallback(new BrickletIndustrialDigitalIn4.Interrupt(InterruptCB));

		// Enable interrupt on pin 0
		idi4.SetInterrupt(1 << 0);

		System.Console.WriteLine("Press key to exit");
		System.Console.ReadKey();
		ipcon.Destroy();
	}
}
