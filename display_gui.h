#ifndef DISPLAY_GUI_H
#define DISPLAY_GUI_H

#include "xil_types.h"
#include "perclos_fsm.h"
#include "pmod_alarm.h"

// Color definitions (32-bit ARGB 0x00RRGGBB)
#define COLOR_BG            0x000B132B
#define COLOR_CARD_BG       0x001C2541
#define COLOR_CARD_BORDER   0x003A506B
#define COLOR_WHITE         0x00FFFFFF
#define COLOR_TEXT_MUTED    0x0094A3B8
#define COLOR_ALERT_GREEN   0x0010B981
#define COLOR_WARN_YELLOW   0x00FBBF24
#define COLOR_DROWSY_RED    0x00EF4444
#define COLOR_CRITICAL_RED  0x00DC2626
#define COLOR_CYAN          0x0038BDF8
#define COLOR_GOLD          0x00F59E0B
#define COLOR_GRAY          0x00475569
#define COLOR_DARK_SLATE    0x000F172A

typedef struct {
    u32 trng_ready;
    u32 health_pass;
    u32 health_error;
    u32 nonce[4];
} trng_gui_info_t;

void gui_init(u32 fb_base_addr, u32 width, u32 height);
void gui_clear(u32 color);
void gui_draw_pixel(int x, int y, u32 color);
void gui_draw_rect(int x, int y, int w, int h, u32 color);
void gui_draw_rect_outline(int x, int y, int w, int h, int thickness, u32 color);
void gui_draw_char(int x, int y, char c, u32 color, u32 bg_color, int scale);
void gui_draw_string(int x, int y, const char* str, u32 color, u32 bg_color, int scale);
void gui_draw_image_q15(int x, int y, const u32* img_pixels, int src_w, int src_h, int scale);

void gui_render_dashboard(
    const u32* img_pixels,
    int logit0,
    int logit1,
    u32 pred,
    int ascon_pass,
    const perclos_fsm_t* fsm,
    const pmod_alarm_status_t* alarm,
    const trng_gui_info_t* trng_info,
    u32 frame_idx
);

#endif // DISPLAY_GUI_H
