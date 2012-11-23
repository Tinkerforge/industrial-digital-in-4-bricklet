
#include <stdio.h>

#include "ip_connection.h"
#include "bricklet_industrial_digital_in_4.h"

#define HOST "localhost"
#define PORT 4223
#define UID "xyz" // Change to your UID

// Callback function for interrupts
void cb_interrupt(uint8_t interrupt_mask, uint8_t value_mask) {
	printf("Interrupt by: %d\n", interrupt_mask);
	printf("Value: %d\n", value_mask);
}

int main() {
	// Create IP connectidi4n to brickd
	IPConnection ipcon;
	if(ipcon_create(&ipcon, HOST, PORT) < 0) {
		fprintf(stderr, "Could not create connectidi4n\n");
		exit(1);
	}

	// Create device object
	IndustrialDigitalIn4 idi4;
	industrial_digital_in_4_create(&idi4, UID); 

	// Add device to IP connectidi4n
	if(ipcon_add_device(&ipcon, &idi4) < 0) {
		fprintf(stderr, "Could not connect to Bricklet\n");
		exit(1);
	}
	// Don't use device before it is added to a connectidi4n

	// Register callback for interrupts
	industrial_digital_in_4_register_callback(&idi4, INDUSTRIAL_DIGITAL_IN_4_CALLBACK_INTERRUPT, cb_interrupt);

	// Enable interrupt on pin 0
	industrial_digital_in_4_set_interrupt(&idi4, 1 << 0);

	printf("Press key to exit\n");
	getchar();
	ipcon_destroy(&ipcon);
}
