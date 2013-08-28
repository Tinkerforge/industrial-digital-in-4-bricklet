/* industrial-digital-in-4-bricklet
 * Copyright (C) 2012 Olaf Lüke <olaf@tinkerforge.com>
 *
 * digital_in_4.c: Implementation of Industrial Digital In 4 Bricklet messages
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

#include "digital_in_4.h"

#include "brickletlib/bricklet_entry.h"
#include "bricklib/utility/mutex.h"
#include "bricklib/utility/init.h"
#include "bricklib/bricklet/bricklet_communication.h"
#include "bricklib/drivers/pio/pio.h"
#include "config.h"

void invocation(const ComType com, const uint8_t *data) {
	switch(((MessageHeader*)data)->fid) {
		case FID_GET_VALUE: {
			get_value(com, (GetValue*)data);
			break;
		}

		case FID_SET_GROUP: {
			set_group(com, (SetGroup*)data);
			break;
		}

		case FID_GET_GROUP: {
			get_group(com, (GetGroup*)data);
			break;
		}

		case FID_GET_AVAILABLE_FOR_GROUP: {
			get_available_for_group(com, (GetAvailableForGroup*)data);
			break;
		}

		case FID_SET_DEBOUNCE_PERIOD: {
			set_debounce_period(com, (SetDebouncePeriod*)data);
			break;
		}

		case FID_GET_DEBOUNCE_PERIOD: {
			get_debounce_period(com, (GetDebouncePeriod*)data);
			break;
		}

		case FID_SET_INTERRUPT: {
			set_interrupt(com, (SetInterrupt*)data);
			break;
		}

		case FID_GET_INTERRUPT: {
			get_interrupt(com, (GetInterrupt*)data);
			break;
		}

		case FID_GET_EDGE_COUNT: {
			get_edge_count(com, (GetEdgeCount*)data);
			break;
		}

		case FID_SET_EDGE_COUNT_CONFIG: {
			set_edge_count_config(com, (SetEdgeCountConfig*)data);
			break;
		}

		case FID_GET_EDGE_COUNT_CONFIG: {
			get_edge_count_config(com, (GetEdgeCountConfig*)data);
			break;
		}

		default: {
			BA->com_return_error(data, sizeof(MessageHeader), MESSAGE_ERROR_CODE_NOT_SUPPORTED, com);
			break;
		}
	}
}

void constructor(void) {
	_Static_assert(sizeof(BrickContext) <= BRICKLET_CONTEXT_MAX_SIZE, "BrickContext too big");

	BC->magic_number1 = MAGIC_NUMBER_INDUSTRIAL_DIGITAL_IN_4_1;
	BC->magic_number2 = MAGIC_NUMBER_INDUSTRIAL_DIGITAL_IN_4_2;

	BC->group[0] = 'n';
	BC->group[1] = 'n';
	BC->group[2] = 'n';
	BC->group[3] = 'n';

	reconfigure_group();
	reconfigure_pins();

	BC->counter = 0;
	BC->interrupt = 0;
	BC->debounce_period = 100;
	BC->last_value = ~make_value();

	reset_all_edge_counters();
}

void destructor(void) {
	for(uint8_t i = 0; i < NUM_PINS; i++) {
		if(BC->pins[i] != NULL) {
			BC->pins[i]->type = PIO_INPUT;
			BC->pins[i]->attribute = PIO_PULLUP;
			BA->PIO_Configure(BC->pins[i], 1);
		}
	}
}

void reconfigure_pins(void) {
	for(uint8_t i = 0; i < NUM_PINS; i++) {
		if(BC->pins[i] != NULL) {
			BC->pins[i]->type = PIO_INPUT;
			BC->pins[i]->attribute = PIO_DEFAULT;
			BA->PIO_Configure(BC->pins[i], 1);
		}
	}
}

uint16_t make_value(void) {
	uint16_t value = 0;
	for(uint8_t i = 0; i < NUM_PINS; i++) {
		if(BC->pins[i] != NULL) {
			if(!(BC->pins[i]->pio->PIO_PDSR & BC->pins[i]->mask)) {
				value |= (1 << i);
			}
		}
	}

	return value;
}

bool is_group_available(const char group) {
	const int8_t diff = BS->port - group;
	return (BCO(diff)->magic_number1 == MAGIC_NUMBER_INDUSTRIAL_DIGITAL_IN_4_1) &&
	       (BCO(diff)->magic_number2 == MAGIC_NUMBER_INDUSTRIAL_DIGITAL_IN_4_2);
}

void reconfigure_group(void) {
	if(BC->group[0] == 'n' && BC->group[1] == 'n' && BC->group[2] == 'n' && BC->group[3] == 'n') {
		BC->pins[0] = &PIN0;
		BC->pins[1] = &PIN1;
		BC->pins[2] = &PIN2;
		BC->pins[3] = &PIN3;
		BC->pins[4] = NULL;
		BC->pins[5] = NULL;
		BC->pins[6] = NULL;
		BC->pins[7] = NULL;
		BC->pins[8] = NULL;
		BC->pins[9] = NULL;
		BC->pins[10] = NULL;
		BC->pins[11] = NULL;
		BC->pins[12] = NULL;
		BC->pins[13] = NULL;
		BC->pins[14] = NULL;
		BC->pins[15] = NULL;
	} else {
		for(uint8_t i = 0; i < 4; i++) {
			const uint8_t start = i*4;
			const int8_t diff = BS->port - BC->group[i];
			if(diff > -4 && diff < 4) {
				BC->pins[start+0] = &BSO(diff)->pin1_ad;
				BC->pins[start+1] = &BSO(diff)->pin2_da;
				BC->pins[start+2] = &BSO(diff)->pin3_pwm;
				BC->pins[start+3] = &BSO(diff)->pin4_io;
			} else {
				BC->pins[start+0] = NULL;
				BC->pins[start+1] = NULL;
				BC->pins[start+2] = NULL;
				BC->pins[start+3] = NULL;
			}
		}
	}

	reset_all_edge_counters();
}

void reset_all_edge_counters(void) {
	for(uint8_t i = 0; i < NUM_PINS; i++) {
		BC->edge_count[i] = 0;
		BC->edge_type[i] = EDGE_TYPE_RISING;
		BC->edge_debounce[i] = 100;
		BC->edge_debounce_counter[i] = 0;
		BC->edge_last_state[i] = !(BC->pins[i]->pio->PIO_PDSR & BC->pins[i]->mask) ? 1 : 0;
	}
}

void tick(const uint8_t tick_type) {
	if(tick_type & TICK_TASK_TYPE_CALCULATION) {
		if(BC->counter != 0) {
			BC->counter--;
		}

		// edge counter
		for(uint8_t i = 0; i < NUM_PINS; i++) {
			if(BC->edge_debounce_counter[i] != 0) {
				BC->edge_debounce_counter[i]--;
			}

			if(BC->edge_debounce_counter[i] == 0 && BC->pins[i] != NULL) {
				uint8_t state = !(BC->pins[i]->pio->PIO_PDSR & BC->pins[i]->mask) ? 1 : 0;

				if(state != BC->edge_last_state[i]) {
					BC->edge_last_state[i] = state;
					BC->edge_debounce_counter[i] = BC->edge_debounce[i];

					if(state) {
						if(BC->edge_type[i] == EDGE_TYPE_RISING || BC->edge_type[i] == EDGE_TYPE_BOTH) {
							BC->edge_count[i]++;
						}
					} else {
						if(BC->edge_type[i] == EDGE_TYPE_FALLING || BC->edge_type[i] == EDGE_TYPE_BOTH) {
							BC->edge_count[i]++;
						}
					}
				}
			}
		}
	}

	if(tick_type & TICK_TASK_TYPE_MESSAGE) {
		if(BC->interrupt != 0) {
			if(BC->counter == 0) {
				uint16_t value = make_value();
				uint8_t interrupt = 0;
				for(uint8_t i = 0; i < NUM_PINS; i++) {
					if(BC->interrupt & (1 << i)) {
						if(((value & (1 << i)) != (BC->last_value & (1 << i)))) {
							interrupt |= (1 << i);
						}
					}
				}
				BC->last_value = value;
				if(interrupt != 0) {
					InterruptSignal is;
					BA->com_make_default_header(&is, BS->uid, sizeof(InterruptSignal), FID_INTERRUPT);
					is.interrupt_mask = interrupt;
					is.value_mask = value;

					BA->send_blocking_with_timeout(&is,
												   sizeof(InterruptSignal),
												   *BA->com_current);
					BC->counter = BC->debounce_period;
				}
			}
		}
	}
}

void get_value(const ComType com, const GetValue *data) {
	GetValueReturn gvr;
	gvr.header        = data->header;
	gvr.header.length = sizeof(GetValueReturn);
	gvr.value_mask    = make_value();

	BA->send_blocking_with_timeout(&gvr, sizeof(GetValueReturn), com);
}

void set_group(const ComType com, const SetGroup *data) {
	bool error = false;

	for(uint8_t i = 0; i < 4; i++) {
		char group = data->group[i];
		if(group < 'a') {
			group += 'a' - 'A';
		}
		if((group >= 'a' && group <= 'd' && is_group_available(group)) || group == 'n') {
			BC->group[i] = group;
		} else {
			BC->group[i] = 'n';
			error = true;
		}
	}

	reconfigure_group();

	if(error) {
		BA->com_return_error(data, sizeof(MessageHeader), MESSAGE_ERROR_CODE_INVALID_PARAMETER, com);
	} else {
		BA->com_return_setter(com, data);
	}
}

void get_group(const ComType com, const GetGroup *data) {
	GetGroupReturn ggr;

	ggr.header         = data->header;
	ggr.header.length  = sizeof(GetGroupReturn);
	ggr.group[0]       = BC->group[0];
	ggr.group[1]       = BC->group[1];
	ggr.group[2]       = BC->group[2];
	ggr.group[3]       = BC->group[3];

	BA->send_blocking_with_timeout(&ggr, sizeof(GetGroupReturn), com);
}

void get_available_for_group(const ComType com, const GetAvailableForGroup *data) {
	GetAvailableForGroupReturn gafgr;

	gafgr.header         = data->header;
	gafgr.header.length  = sizeof(GetAvailableForGroupReturn);
	gafgr.available      = 0;

	for(uint8_t i = 0; i < 4; i++) {
		if(is_group_available((char)(i+'a'))) {
			gafgr.available |= (1 << i);
		}
	}

	BA->send_blocking_with_timeout(&gafgr, sizeof(GetAvailableForGroupReturn), com);
}

void set_debounce_period(const ComType com, const SetDebouncePeriod *data) {
	BC->debounce_period = data->debounce;

	BA->com_return_setter(com, data);
}

void get_debounce_period(const ComType com, const GetDebouncePeriod *data) {
	GetDebouncePeriodReturn gdpr;

	gdpr.header         = data->header;
	gdpr.header.length  = sizeof(GetDebouncePeriodReturn);
	gdpr.debounce       = BC->debounce_period;

	BA->send_blocking_with_timeout(&gdpr, sizeof(GetDebouncePeriodReturn), com);
}

void set_interrupt(const ComType com, const SetInterrupt *data) {
	BC->interrupt = data->interrupt_mask;

	BA->com_return_setter(com, data);
}

void get_interrupt(const ComType com, const GetInterrupt *data) {
	GetInterruptReturn gir;

	gir.header         = data->header;
	gir.header.length  = sizeof(GetInterruptReturn);
	gir.interrupt_mask = BC->interrupt;

	BA->send_blocking_with_timeout(&gir, sizeof(GetInterruptReturn), com);
}

void get_edge_count(const ComType com, const GetEdgeCount *data) {
	if(data->pin >= NUM_PINS) {
		BA->com_return_error(data, sizeof(GetEdgeCountReturn), MESSAGE_ERROR_CODE_INVALID_PARAMETER, com);
		return;
	}

	GetEdgeCountReturn gecr;

	gecr.header        = data->header;
	gecr.header.length = sizeof(GetEdgeCountReturn);
	gecr.count         = BC->edge_count[data->pin];

	BA->send_blocking_with_timeout(&gecr,
	                               sizeof(GetEdgeCountReturn),
	                               com);

	if(data->reset_counter) {
		BC->edge_count[data->pin] = 0;
	}
}

void set_edge_count_config(const ComType com, const SetEdgeCountConfig *data) {
	if(data->edge_type > EDGE_TYPE_BOTH) {
		BA->com_return_error(data, sizeof(MessageHeader), MESSAGE_ERROR_CODE_INVALID_PARAMETER, com);
		return;
	}

	for(uint8_t i = 0; i < NUM_PINS; i++) {
		if(data->selection_mask & (1 << i)) {
			BC->edge_type[i] = data->edge_type;
			BC->edge_debounce[i] = data->debounce;
			BC->edge_count[i] = 0;
		}
	}

	BA->com_return_setter(com, data);
}

void get_edge_count_config(const ComType com, const GetEdgeCountConfig *data) {
	if(data->pin >= NUM_PINS) {
		BA->com_return_error(data, sizeof(GetEdgeCountConfigReturn), MESSAGE_ERROR_CODE_INVALID_PARAMETER, com);
		return;
	}

	GetEdgeCountConfigReturn geccr;

	geccr.header        = data->header;
	geccr.header.length = sizeof(GetEdgeCountConfigReturn);
	geccr.edge_type     = BC->edge_type[data->pin];
	geccr.debounce      = BC->edge_debounce[data->pin];

	BA->send_blocking_with_timeout(&geccr,
	                               sizeof(GetEdgeCountConfigReturn),
	                               com);
}
