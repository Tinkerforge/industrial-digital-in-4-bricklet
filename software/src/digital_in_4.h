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

#include "bricklib/com/com_common.h"

#define FID_GET_VALUE 1
#define FID_SET_GROUP 2
#define FID_GET_GROUP 3
#define FID_GET_AVAILABLE_FOR_GROUP 4
#define FID_SET_DEBOUNCE_PERIOD 5
#define FID_GET_DEBOUNCE_PERIOD 6
#define FID_SET_INTERRUPT 7
#define FID_GET_INTERRUPT 8
#define FID_INTERRUPT 9

#define NUM_MESSAGES 9

typedef struct {
	MessageHeader header;
} __attribute__((__packed__)) GetValue;

typedef struct {
	MessageHeader header;
	uint16_t value_mask;
} __attribute__((__packed__)) GetValueReturn;

typedef struct {
	MessageHeader header;
	char group[4];
} __attribute__((__packed__)) SetGroup;

typedef struct {
	MessageHeader header;
} __attribute__((__packed__)) GetGroup;

typedef struct {
	MessageHeader header;
	char group[4];
} __attribute__((__packed__)) GetGroupReturn;

typedef struct {
	MessageHeader header;
} __attribute__((__packed__)) GetAvailableForGroup;

typedef struct {
	MessageHeader header;
	uint8_t available;
} __attribute__((__packed__)) GetAvailableForGroupReturn;

typedef struct {
	MessageHeader header;
	uint32_t debounce;
} __attribute__((__packed__)) SetDebouncePeriod;

typedef struct {
	MessageHeader header;
} __attribute__((__packed__)) GetDebouncePeriod;

typedef struct {
	MessageHeader header;
	uint32_t debounce;
} __attribute__((__packed__)) GetDebouncePeriodReturn;

typedef struct {
	MessageHeader header;
	uint16_t interrupt_mask;
} __attribute__((__packed__)) SetInterrupt;

typedef struct {
	MessageHeader header;
} __attribute__((__packed__)) GetInterrupt;

typedef struct {
	MessageHeader header;
	uint16_t interrupt_mask;
} __attribute__((__packed__)) GetInterruptReturn;

typedef struct {
	MessageHeader header;
	uint16_t interrupt_mask;
	uint16_t value_mask;
} __attribute__((__packed__)) InterruptSignal;

typedef struct {
	MessageHeader header;
} __attribute__((__packed__)) StandardMessage;

void get_value(const ComType com, const GetValue *data);
void set_group(const ComType com, const SetGroup *data);
void get_group(const ComType com, const GetGroup *data);
void get_available_for_group(const ComType com, const GetAvailableForGroup *data);
void set_debounce_period(const ComType com, const SetDebouncePeriod *data);
void get_debounce_period(const ComType com, const GetDebouncePeriod *data);
void set_interrupt(const ComType com, const SetInterrupt *data);
void get_interrupt(const ComType com, const GetInterrupt *data);

uint16_t make_value(void);
void reconfigure_group(void);
void reconfigure_pins(void);
void invocation(const ComType com, const uint8_t *data);
void constructor(void);
void destructor(void);
void tick(const uint8_t tick_type);

#endif
