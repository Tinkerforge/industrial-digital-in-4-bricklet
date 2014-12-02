using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "xyz"; // Change to your UID

	// Callback function for interrupts
	static void InterruptCB(BrickletIndustrialDigitalIn4 sender, int interruptMask, int valueMask)
	{
		string interruptBinary = System.Convert.ToString(interruptMask, 2);
		string valueBinary = System.Convert.ToString(valueMask, 2);

		System.Console.WriteLine("Interrupt by: " + interruptBinary);
		System.Console.WriteLine("Value: " + valueBinary);
	}

	static void Main() 
	{
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletIndustrialDigitalIn4 idi4 =
		  new BrickletIndustrialDigitalIn4(UID, ipcon); // Create device object

		ipcon.Connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Register callback for interrupts
		idi4.Interrupt += InterruptCB;

		// Enable interrupt on pin 0
		idi4.SetInterrupt(1 << 0);

		System.Console.WriteLine("Press enter to exit");
		System.Console.ReadLine();
		ipcon.Disconnect();
	}
}
