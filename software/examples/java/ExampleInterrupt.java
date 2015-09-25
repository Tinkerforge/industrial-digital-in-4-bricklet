import com.tinkerforge.IPConnection;
import com.tinkerforge.BrickletIndustrialDigitalIn4;

public class ExampleInterrupt {
	private static final String HOST = "localhost";
	private static final int PORT = 4223;
	private static final String UID = "XYZ"; // Change to your UID

	// Note: To make the example code cleaner we do not handle exceptions. Exceptions
	//       you might normally want to catch are described in the documentation
	public static void main(String args[]) throws Exception {
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletIndustrialDigitalIn4 idi4 =
		  new BrickletIndustrialDigitalIn4(UID, ipcon); // Create device object

		ipcon.connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Add interrupt listener
		idi4.addInterruptListener(new BrickletIndustrialDigitalIn4.InterruptListener() {
			public void interrupt(int interruptMask, int valueMask) {
				System.out.println("Interrupt Mask: " + Integer.toBinaryString(interruptMask));
				System.out.println("Value Mask: " + Integer.toBinaryString(valueMask));
				System.out.println("");
			}
		});

		// Enable interrupt on pin 0
		idi4.setInterrupt(1 << 0);

		System.out.println("Press key to exit"); System.in.read();
		ipcon.disconnect();
	}
}
