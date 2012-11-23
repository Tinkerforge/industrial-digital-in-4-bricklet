
#include <stdio.h>

#include "ip_connection.h"
#include "bricklet_industrial_digital_in_4.h"

#define HOST "localhost"
#define PORT 4223
#define UID "xyz" // Change to your UID

int main() {
	// Create IP connection to brickd
	IPConnection ipcon;
	if(ipcon_create(&ipcon, HOST, PORT) < 0) {
		fprintf(stderr, "Could not create connection\n");
		exit(1);
	}

	// Create device object
	IndustrialDigitalIn4 idi4;
	industrial_digital_in_4_create(&idi4, UID); 

	// Add device to IP connection
	if(ipcon_add_device(&ipcon, &idi4) < 0) {
		fprintf(stderr, "Could not connect to Bricklet\n");
		exit(1);
	}
	// Don't use device before it is added to a connection

	// Read out values as bitmask
	uint16_t value;
	industrial_digital_in_4_get_value(&idi4, &value);
	printf("Value: %d\n", value);

	printf("Press key to exit\n");
	getchar();
	ipcon_destroy(&ipcon);
}
