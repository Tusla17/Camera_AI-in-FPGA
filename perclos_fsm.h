#ifndef PERCLOS_FSM_H
#define PERCLOS_FSM_H

#include "xil_types.h"

#define PERCLOS_WINDOW_SIZE 60
#define HYSTERESIS_UP_COUNT   5
#define HYSTERESIS_DOWN_COUNT 10

typedef enum {
    DROWSY_STATE_AWAKE       = 0,
    DROWSY_STATE_PRE_DROWSY  = 1,
    DROWSY_STATE_DROWSY      = 2,
    DROWSY_STATE_MICROSLEEP  = 3
} drowsy_state_t;

typedef struct {
    u8              history[PERCLOS_WINDOW_SIZE];
    u32             head;
    u32             sample_count;
    u32             closed_count;
    u32             consecutive_closed;
    float           perclos_pct;
    drowsy_state_t  current_state;
    drowsy_state_t  target_state;
    u32             hysteresis_timer;
} perclos_fsm_t;

void           perclos_fsm_init(perclos_fsm_t *fsm);
void           perclos_fsm_update(perclos_fsm_t *fsm, u32 eye_closed_pred);
float          perclos_get_percentage(const perclos_fsm_t *fsm);
drowsy_state_t perclos_get_state(const perclos_fsm_t *fsm);
const char*    perclos_get_state_string(drowsy_state_t state);

#endif // PERCLOS_FSM_H
