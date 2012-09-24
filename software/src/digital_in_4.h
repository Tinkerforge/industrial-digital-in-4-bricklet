/* industrial-digital-in-4-bricklet
 * Copyright (C) 2012 Olaf Lüke <olaf@tinkerforge.com>
 *
 * digital_in_4.h: Implementation of Industrial Digital In 4 Bricklet messages
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

#ifndef DIGITAL_IN_4_H
#define DIGITAL_IN_4_H

#include <stdint.h>

#define TYPE_GET_VALUE 1
#define TYPE_SET_GROUP 2
#define TYPE_GET_GROUP 3
#define TYPE_GET_AVAILABLE_FOR_GROUP 4
#define TYPE_SET_DEBOUNCE_PERIOD 5
#define TYPE_GET_DEBOUNCE_PERIOD 6
#define TYPE_SET_INTERRUPT 7
#define TYPE_GET_INTERRUPT 8
#define TYPE_INTERRUPT 9

#define NUM_MESSAGES 9

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
} __attribute__((__packed__)) GetValue;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint16_t value_mask;
} __attribute__((__packed__)) GetValueReturn;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	char group[4];
} __attribute__((__packed__)) SetGroup;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
} __attribute__((__packed__)) GetGroup;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	char group[4];
} __attribute__((__packed__)) GetGroupReturn;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
} __attribute__((__packed__)) GetAvailableForGroup;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint8_t available;
} __attribute__((__packed__)) GetAvailableForGroupReturn;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint32_t debounce;
} __attribute__((__packed__)) SetDebouncePeriod;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
} __attribute__((__packed__)) GetDebouncePeriod;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint32_t debounce;
} __attribute__((__packed__)) GetDebouncePeriodReturn;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint16_t interrupt_mask;
} __attribute__((__packed__)) SetInterrupt;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
} __attribute__((__packed__)) GetInterrupt;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint16_t interrupt_mask;
} __attribute__((__packed__)) GetInterruptReturn;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
	uint16_t interrupt_mask;
	uint16_t value_mask;
} __attribute__((__packed__)) InterruptSignal;

typedef struct {
	uint8_t stack_id;
	uint8_t type;
	uint16_t length;
} __attribute__((__packed__)) StandardMessage;

void get_value(uint8_t com, const GetValue *data);
void set_group(uint8_t com, SetGroup *data);
void get_group(uint8_t com, GetGroup *data);
void get_available_for_group(uint8_t com, GetAvailableForGroup *data);
void set_debounce_period(uint8_t com, const SetDebouncePeriod *data);
void get_debounce_period(uint8_t com, const GetDebouncePeriod *data);
void set_interrupt(uint8_t com, const SetInterrupt *data);
void get_interrupt(uint8_t com, const GetInterrupt *data);

uint16_t make_value(void);
void reconfigure_group(void);
void reconfigure_pins(void);
void invocation(uint8_t com, uint8_t *data);
void constructor(void);
void destructor(void);
void tick(uint8_t tick_type);

#endif
