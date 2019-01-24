package main

import (
	"fmt"
	"github.com/Tinkerforge/go-api-bindings/industrial_digital_in_4_bricklet"
	"github.com/Tinkerforge/go-api-bindings/ipconnection"
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

	// Get current value as bitmask.
	valueMask, _ := idi4.GetValue()
	fmt.Printf("Value Mask: %b\n", valueMask)

	fmt.Print("Press enter to exit.")
	fmt.Scanln()
}
