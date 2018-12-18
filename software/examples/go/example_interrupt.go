package main

import (
	"fmt"
	"github.com/tinkerforge/go-api-bindings/industrial_digital_in_4_bricklet"
	"github.com/tinkerforge/go-api-bindings/ipconnection"
)

const ADDR string = "localhost:4223"
const UID string = "XYZ" // Change XYZ to the UID of your Industrial Digital In 4 Bricklet.

func main() {
	ipcon := ipconnection.New()
	defer ipcon.Close()
	idi4, _ := industrial_digital_in_4_bricklet.New(UID, &ipcon) // Create device object.

	ipcon.Connect(ADDR) // Connect to brickd.
	defer ipcon.Disconnect()
	// Don't use device before ipcon is connected.

	idi4.RegisterInterruptCallback(func(interruptMask uint16, valueMask uint16) {
		fmt.Printf("Interrupt Mask: %b\n", interruptMask)
		fmt.Printf("Value Mask: %b\n", valueMask)
		fmt.Println()
	})

	// Enable interrupt on pin 0
	idi4.SetInterrupt(1 << 0)

	fmt.Print("Press enter to exit.")
	fmt.Scanln()

}
