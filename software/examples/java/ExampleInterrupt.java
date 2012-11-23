import com.tinkerforge.BrickletIndustrialDigitalIn4;
import com.tinkerforge.IPConnection;

public class ExampleInterrupt {
	private static final String host = "localhost";
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

		// Add and implement listener for interrupt (called if pin 0 changes)
		idi4.addListener(new BrickletIndustrialDigitalIn4.InterruptListener() {
			public void interrupt(int interruptMask, int valueMask) {
				System.out.println("Interrupt by: " + Integer.toBinaryString(interruptMask));
				System.out.println("Value: " + Integer.toBinaryString(valueMask));
			}
		});

		// Enable interrupt on pin 0
		idi4.setInterrupt(1 << 0);

		System.console().readLine("Press key to exit\n");
		ipcon.destroy();
	}
}
