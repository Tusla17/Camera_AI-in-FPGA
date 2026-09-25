#include "pmod_alarm.h"
#include "xil_printf.h"

static pmod_alarm_status_t g_alarm_status;

void pmod_alarm_init(void) {
    g_alarm_status.buzzer_freq_hz = 0;
    g_alarm_status.buzzer_active  = 0;
    g_alarm_status.led_pattern    = PMOD_PIN_LED_GREEN;
    g_alarm_status.blink_phase    = 0;
}

void pmod_alarm_update(drowsy_state_t state, u32 frame_idx) {
    g_alarm_status.blink_phase = frame_idx;

    switch (state) {
        case DROWSY_STATE_AWAKE:
            g_alarm_status.buzzer_freq_hz = 0;
            g_alarm_status.buzzer_active  = 0;
            g_alarm_status.led_pattern    = PMOD_PIN_LED_GREEN; // Solid Green
            break;

        case DROWSY_STATE_PRE_DROWSY:
            // Intermittent soft beep: 1000 Hz beep once every 30 frames (1 Hz at 30fps)
            if ((frame_idx % 30) < 5) {
                g_alarm_status.buzzer_freq_hz = 1000;
                g_alarm_status.buzzer_active  = 1;
            } else {
                g_alarm_status.buzzer_freq_hz = 0;
                g_alarm_status.buzzer_active  = 0;
            }
            // Yellow LED blinking (toggle every 15 frames)
            g_alarm_status.led_pattern = ((frame_idx / 15) % 2) ? PMOD_PIN_LED_YELLOW : 0;
            break;

        case DROWSY_STATE_DROWSY:
            // Medium urgent alarm: 2000 Hz, 50% duty cycle (toggle every 10 frames)
            if ((frame_idx % 20) < 10) {
                g_alarm_status.buzzer_freq_hz = 2000;
                g_alarm_status.buzzer_active  = 1;
            } else {
                g_alarm_status.buzzer_freq_hz = 0;
                g_alarm_status.buzzer_active  = 0;
            }
            // Red LED fast blinking (toggle every 6 frames)
            g_alarm_status.led_pattern = ((frame_idx / 6) % 2) ? PMOD_PIN_LED_RED : 0;
            break;

        case DROWSY_STATE_MICROSLEEP:
            // High priority emergency dual-tone siren: 2500 Hz <-> 3500 Hz alternating every 5 frames
            g_alarm_status.buzzer_active  = 1;
            g_alarm_status.buzzer_freq_hz = ((frame_idx / 5) % 2) ? 2500 : 3500;
            // Red LED + Yellow strobe flash (toggle every 3 frames)
            g_alarm_status.led_pattern = ((frame_idx / 3) % 2) ? (PMOD_PIN_LED_RED | PMOD_PIN_LED_YELLOW) : 0;
            break;

        default:
            g_alarm_status.buzzer_freq_hz = 0;
            g_alarm_status.buzzer_active  = 0;
            g_alarm_status.led_pattern    = 0;
            break;
    }
}

pmod_alarm_status_t pmod_alarm_get_status(void) {
    return g_alarm_status;
}
