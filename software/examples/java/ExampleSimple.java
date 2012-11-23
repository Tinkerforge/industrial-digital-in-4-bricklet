import com.tinkerforge.BrickletIndustrialDigitalIn4;
import com.tinkerforge.IPConnection;

public class ExampleSimple {
	private static final String host = "192.168.178.29";
	private static final int port = 4223;
	private static final String UID = "xyz"; // Change to your UID
	
	// Note: To make the example code cleaner we do not handle exceptions. Exceptions you
	//       might normally want to catch are described in the commnents below
	public static void main(String args[]) throws Exception {
		// Create connection to brickd
		IPConnection ipcon = new IPConnection(host, port); // Can throw IOException
		BrickletIndustrialDigitalIn4 idi4 = new BrickletIndustrialDigitalIn4(UID); // Create device object

		// Add device to IP connection
		ipcon.addDevice(idi4); // Can throw IPConnection.TimeoutException
		// Don't use device before it is added to a connection

		// Read out values as bitmask
		int value = idi4.getValue();
		System.out.println("value: " + value);

		System.console().readLine("Press key to exit\n");
		ipcon.destroy();
	}
}
