using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "xyz"; // Change to your UID

	static void Main() 
	{
		IPConnection ipcon = new IPConnection(HOST, PORT); // Create connection to brickd
		BrickletIndustrialDigitalIn4 idi4 = new BrickletIndustrialDigitalIn4(UID); // Create device object
		ipcon.AddDevice(idi4); // Add device to IP connection
		// Don't use device before it is added to a connection

		// Read out values as bitmask
		int value = idi4.GetValue();
		System.Console.WriteLine("Value: " + value);

		System.Console.WriteLine("Press key to exit");
		System.Console.ReadKey();
		ipcon.Destroy();
	}
}
