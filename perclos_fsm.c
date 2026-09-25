#include "perclos_fsm.h"

void perclos_fsm_init(perclos_fsm_t *fsm) {
    if (!fsm) return;
    for (int i = 0; i < PERCLOS_WINDOW_SIZE; i++) {
        fsm->history[i] = 0;
    }
    fsm->head               = 0;
    fsm->sample_count       = 0;
    fsm->closed_count       = 0;
    fsm->consecutive_closed = 0;
    fsm->perclos_pct        = 0.0f;
    fsm->current_state      = DROWSY_STATE_AWAKE;
    fsm->target_state       = DROWSY_STATE_AWAKE;
    fsm->hysteresis_timer   = 0;
}

void perclos_fsm_update(perclos_fsm_t *fsm, u32 eye_closed_pred) {
    if (!fsm) return;

    u8 is_closed = (eye_closed_pred != 0) ? 1 : 0;

    // Update circular buffer
    u8 old_val = fsm->history[fsm->head];
    fsm->history[fsm->head] = is_closed;
    fsm->head = (fsm->head + 1) % PERCLOS_WINDOW_SIZE;

    if (fsm->sample_count < PERCLOS_WINDOW_SIZE) {
        fsm->sample_count++;
        if (is_closed) fsm->closed_count++;
    } else {
        if (is_closed && !old_val) {
            fsm->closed_count++;
        } else if (!is_closed && old_val) {
            if (fsm->closed_count > 0) fsm->closed_count--;
        }
    }

    // Consecutive closed counter
    if (is_closed) {
        fsm->consecutive_closed++;
    } else {
        fsm->consecutive_closed = 0;
    }

    // Compute PERCLOS percentage
    if (fsm->sample_count > 0) {
        fsm->perclos_pct = ((float)fsm->closed_count / (float)fsm->sample_count) * 100.0f;
    } else {
        fsm->perclos_pct = 0.0f;
    }

    // Determine raw target state based on PERCLOS & consecutive closure
    drowsy_state_t raw_state;
    if (fsm->perclos_pct >= 70.0f || fsm->consecutive_closed >= 30) {
        raw_state = DROWSY_STATE_MICROSLEEP;
    } else if (fsm->perclos_pct >= 40.0f || fsm->consecutive_closed >= 15) {
        raw_state = DROWSY_STATE_DROWSY;
    } else if (fsm->perclos_pct >= 20.0f || fsm->consecutive_closed >= 5) {
        raw_state = DROWSY_STATE_PRE_DROWSY;
    } else {
        raw_state = DROWSY_STATE_AWAKE;
    }

    // Hysteresis State Transition Logic
    if (raw_state != fsm->current_state) {
        if (raw_state == fsm->target_state) {
            fsm->hysteresis_timer++;
            u32 required_count = (raw_state > fsm->current_state) ? HYSTERESIS_UP_COUNT : HYSTERESIS_DOWN_COUNT;
            if (fsm->hysteresis_timer >= required_count) {
                fsm->current_state    = raw_state;
                fsm->hysteresis_timer = 0;
            }
        } else {
            fsm->target_state     = raw_state;
            fsm->hysteresis_timer = 1;
        }
    } else {
        fsm->target_state     = fsm->current_state;
        fsm->hysteresis_timer = 0;
    }
}

float perclos_get_percentage(const perclos_fsm_t *fsm) {
    return fsm ? fsm->perclos_pct : 0.0f;
}

drowsy_state_t perclos_get_state(const perclos_fsm_t *fsm) {
    return fsm ? fsm->current_state : DROWSY_STATE_AWAKE;
}

const char* perclos_get_state_string(drowsy_state_t state) {
    switch (state) {
        case DROWSY_STATE_AWAKE:       return "AWAKE [NORMAL]";
        case DROWSY_STATE_PRE_DROWSY:  return "PRE-DROWSY [EARLY WARNING]";
        case DROWSY_STATE_DROWSY:      return "DROWSY [ACTIVE ALARM]";
        case DROWSY_STATE_MICROSLEEP:  return "MICROSLEEP [EMERGENCY SIREN]";
        default:                       return "UNKNOWN";
    }
}
