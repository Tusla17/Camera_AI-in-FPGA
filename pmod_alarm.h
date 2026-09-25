#ifndef PMOD_ALARM_H
#define PMOD_ALARM_H

#include "xil_types.h"
#include "perclos_fsm.h"

// PMOD / GPIO Bit assignments (on ZCU106 PMOD0 / PMOD1)
#define PMOD_PIN_BUZZER_PWM 0x01
#define PMOD_PIN_LED_GREEN  0x02
#define PMOD_PIN_LED_YELLOW 0x04
#define PMOD_PIN_LED_RED    0x08

typedef struct {
    u32 buzzer_freq_hz;
    u32 buzzer_active;
    u32 led_pattern;
    u32 blink_phase;
} pmod_alarm_status_t;

void pmod_alarm_init(void);
void pmod_alarm_update(drowsy_state_t state, u32 frame_idx);
pmod_alarm_status_t pmod_alarm_get_status(void);

#endif // PMOD_ALARM_H
