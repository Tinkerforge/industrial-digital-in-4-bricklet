import com.tinkerforge.IPConnection;
import com.tinkerforge.BrickletIndustrialDigitalIn4;

public class ExampleSimple {
	private static final String HOST = "localhost";
	private static final int PORT = 4223;

	// Change XYZ to the UID of your Industrial Digital In 4 Bricklet
	private static final String UID = "XYZ";

	// Note: To make the example code cleaner we do not handle exceptions. Exceptions
	//       you might normally want to catch are described in the documentation
	public static void main(String args[]) throws Exception {
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletIndustrialDigitalIn4 idi4 =
		  new BrickletIndustrialDigitalIn4(UID, ipcon); // Create device object

		ipcon.connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Get current value as bitmask
		int valueMask = idi4.getValue(); // Can throw com.tinkerforge.TimeoutException
		System.out.println("Value Mask: " + Integer.toBinaryString(valueMask));

		System.out.println("Press key to exit"); System.in.read();
		ipcon.disconnect();
	}
}
