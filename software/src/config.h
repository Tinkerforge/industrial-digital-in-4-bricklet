/* industrial-digital-in-4-bricklet
 * Copyright (C) 2012 Olaf Lüke <olaf@tinkerforge.com>
 *
 * config.h: Industrial Digital In 4 Bricklet specific configuration
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#ifndef CONFIG_H
#define CONFIG_H

#include <stdint.h>
#include <stdbool.h>

#include "bricklib/drivers/board/sam3s/SAM3S.h"
#include "bricklib/drivers/pio/pio.h"
#include "brickletlib/bricklet_entry.h"

#include "digital_in_4.h"

#define BRICKLET_FIRMWARE_VERSION_MAJOR 2
#define BRICKLET_FIRMWARE_VERSION_MINOR 0
#define BRICKLET_FIRMWARE_VERSION_REVISION 0

#define BRICKLET_HARDWARE_VERSION_MAJOR 1
#define BRICKLET_HARDWARE_VERSION_MINOR 0
#define BRICKLET_HARDWARE_VERSION_REVISION 0

#define BRICKLET_DEVICE_IDENTIFIER 223

#define INVOCATION_IN_BRICKLET_CODE
#define PIN0 (BS->pin1_ad)
#define PIN1 (BS->pin2_da)
#define PIN2 (BS->pin3_pwm)
#define PIN3 (BS->pin4_io)

#define NUM_PINS 16

#define MAGIC_NUMBER_INDUSTRIAL_DIGITAL_IN_4_1 3061362463L
#define MAGIC_NUMBER_INDUSTRIAL_DIGITAL_IN_4_2 2935864467L

typedef struct {
	Pin *pins[NUM_PINS];
	uint16_t last_value;
	char group[4];
	uint32_t counter;
	uint16_t interrupt;
	uint32_t debounce_period;
	uint32_t magic_number1;
	uint32_t magic_number2;
} BrickContext;

#endif
