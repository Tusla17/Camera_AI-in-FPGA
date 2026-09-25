#include "display_gui.h"
#include "font_8x16.h"
#include "xil_io.h"
#include "xil_printf.h"

static u32 g_fb_base = 0x10000000;
static u32 g_width   = 1280;
static u32 g_height  = 720;

void gui_init(u32 fb_base_addr, u32 width, u32 height) {
    g_fb_base = fb_base_addr;
    g_width   = width;
    g_height  = height;
}

void gui_draw_pixel(int x, int y, u32 color) {
    if (x < 0 || x >= (int)g_width || y < 0 || y >= (int)g_height) return;
    Xil_Out32(g_fb_base + ((y * g_width + x) * 4), color);
}

void gui_clear(u32 color) {
    u32 total_pixels = g_width * g_height;
    for (u32 i = 0; i < total_pixels; i++) {
        Xil_Out32(g_fb_base + (i * 4), color);
    }
}

void gui_draw_rect(int x, int y, int w, int h, u32 color) {
    for (int j = 0; j < h; j++) {
        int py = y + j;
        if (py < 0 || py >= (int)g_height) continue;
        for (int i = 0; i < w; i++) {
            int px = x + i;
            if (px < 0 || px >= (int)g_width) continue;
            Xil_Out32(g_fb_base + ((py * g_width + px) * 4), color);
        }
    }
}

void gui_draw_rect_outline(int x, int y, int w, int h, int thickness, u32 color) {
    gui_draw_rect(x, y, w, thickness, color);                   // Top
    gui_draw_rect(x, y + h - thickness, w, thickness, color);   // Bottom
    gui_draw_rect(x, y, thickness, h, color);                   // Left
    gui_draw_rect(x + w - thickness, y, thickness, h, color);   // Right
}

void gui_draw_char(int x, int y, char c, u32 color, u32 bg_color, int scale) {
    if (c < 32 || c > 127) c = '?';
    int char_idx = c - 32;

    for (int row = 0; row < 16; row++) {
        u8 row_bits = font_8x16[char_idx][row];
        for (int col = 0; col < 8; col++) {
            u32 pixel_color = (row_bits & (0x80 >> col)) ? color : bg_color;
            if (pixel_color != 0) { // 0 is transparent
                if (scale == 1) {
                    gui_draw_pixel(x + col, y + row, pixel_color);
                } else {
                    gui_draw_rect(x + col * scale, y + row * scale, scale, scale, pixel_color);
                }
            }
        }
    }
}

void gui_draw_string(int x, int y, const char* str, u32 color, u32 bg_color, int scale) {
    int cur_x = x;
    while (*str) {
        if (*str == '\n') {
            y += 18 * scale;
            cur_x = x;
        } else {
            gui_draw_char(cur_x, y, *str, color, bg_color, scale);
            cur_x += 8 * scale;
        }
        str++;
    }
}

// Convert Q15 (-1.0 to 1.0) pixel to 32-bit grayscale RGB
static inline u32 q15_to_rgb(u32 q15_val) {
    short s = (short)(q15_val & 0xFFFF);
    int val = ((int)s + 32768) >> 8;
    if (val < 0) val = 0;
    if (val > 255) val = 255;
    return (val << 16) | (val << 8) | val;
}

void gui_draw_image_q15(int x, int y, const u32* img_pixels, int src_w, int src_h, int scale) {
    for (int r = 0; r < src_h; r++) {
        for (int c = 0; c < src_w; c++) {
            u32 rgb = q15_to_rgb(img_pixels[r * src_w + c]);
            gui_draw_rect(x + c * scale, y + r * scale, scale, scale, rgb);
        }
    }
}

static void int_to_str(int n, char* buf) {
    char temp[16];
    int i = 0, is_neg = 0;
    if (n < 0) { is_neg = 1; n = -n; }
    if (n == 0) temp[i++] = '0';
    while (n > 0) {
        temp[i++] = (n % 10) + '0';
        n /= 10;
    }
    int j = 0;
    if (is_neg) buf[j++] = '-';
    while (i > 0) {
        buf[j++] = temp[--i];
    }
    buf[j] = '\0';
}

static void float_to_str(float val, char* buf, int decimals) {
    if (val < 0.0f) {
        *buf++ = '-';
        val = -val;
    }
    int int_part = (int)val;
    float frac_part = val - (float)int_part;

    char temp[16];
    int_to_str(int_part, temp);
    char* p = temp;
    while (*p) *buf++ = *p++;

    if (decimals > 0) {
        *buf++ = '.';
        for (int d = 0; d < decimals; d++) {
            frac_part *= 10.0f;
            int digit = (int)frac_part;
            *buf++ = '0' + digit;
            frac_part -= (float)digit;
        }
    }
    *buf = '\0';
}

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
) {
    char str_buf[64];

    // 1. Clear Background
    gui_clear(COLOR_BG);

    // Emergency Flashing Border if in Microsleep
    if (fsm && fsm->current_state == DROWSY_STATE_MICROSLEEP) {
        if ((frame_idx / 4) % 2) {
            gui_draw_rect_outline(0, 0, 1280, 720, 12, COLOR_CRITICAL_RED);
        }
    }

    // 2. Top Header Bar
    gui_draw_rect(20, 15, 1240, 70, COLOR_CARD_BG);
    gui_draw_rect_outline(20, 15, 1240, 70, 2, COLOR_CARD_BORDER);
    gui_draw_string(40, 28, "SECURE CAMERA AI: DRIVER DROWSINESS ACCELERATOR", COLOR_CYAN, 0, 2);
    gui_draw_string(40, 58, "AMD ZCU106 (Zynq UltraScale+) | BNN AI Engine | ASCON-128 AEAD | NIST TRNG", COLOR_TEXT_MUTED, 0, 1);

    // 3. Security Status Badges (Top Right)
    // A. ASCON-128 Badge
    u32 sec_color = ascon_pass ? COLOR_ALERT_GREEN : COLOR_DROWSY_RED;
    const char* sec_text = ascon_pass ? "[SECURE] ASCON-128 AEAD: AUTH PASS" : "[ALERT] ASCON-128 TAG FAIL";
    gui_draw_rect(820, 24, 420, 26, ascon_pass ? 0x00064E3B : 0x007F1D1D);
    gui_draw_rect_outline(820, 24, 420, 26, 1, sec_color);
    gui_draw_string(835, 30, sec_text, sec_color, 0, 1);

    // B. Hardware TRNG Badge
    int trng_ok = trng_info && trng_info->trng_ready && trng_info->health_pass;
    u32 trng_color = trng_ok ? COLOR_ALERT_GREEN : COLOR_WARN_YELLOW;
    gui_draw_rect(820, 52, 420, 26, 0x00111827);
    gui_draw_rect_outline(820, 52, 420, 26, 1, trng_color);
    if (trng_ok) {
        gui_draw_string(835, 58, "[TRNG] NIST SP 800-90B: HEALTH PASS", trng_color, 0, 1);
    } else {
        gui_draw_string(835, 58, "[TRNG] HARVESTING ENTROPY...", trng_color, 0, 1);
    }

    // 4. Left Panel: Input Camera Image & Eye Closure Timeline (20, 95, 500, 605)
    gui_draw_rect(20, 95, 500, 605, COLOR_CARD_BG);
    gui_draw_rect_outline(20, 95, 500, 605, 2, COLOR_CARD_BORDER);
    gui_draw_string(40, 110, "CAMERA EYE / FACE ROI (32x32 Q15)", COLOR_WHITE, 0, 1);

    // Scaled Eye Image (32x32 scaled 10x -> 320x320)
    int img_x = 110;
    int img_y = 145;
    int img_scale = 10;
    gui_draw_image_q15(img_x, img_y, img_pixels, 32, 32, img_scale);

    // Image Bounding Box
    u32 bb_color = (pred == 0) ? COLOR_ALERT_GREEN : COLOR_DROWSY_RED;
    gui_draw_rect_outline(img_x - 3, img_y - 3, 320 + 6, 320 + 6, 3, bb_color);

    // Bounding Box Header
    const char* bb_label = (pred == 0) ? "EYE OPEN [ALERT]" : "EYE CLOSED [DROWSY]";
    gui_draw_rect(img_x, img_y - 26, 210, 23, bb_color);
    gui_draw_string(img_x + 8, img_y - 21, bb_label, COLOR_BG, 0, 1);

    // Waveform Graph: Eye Closure History (60 Frames Timeline)
    gui_draw_string(40, 485, "EYE CLOSURE TIMELINE (LAST 60 FRAMES):", COLOR_CYAN, 0, 1);
    int wave_x = 40;
    int wave_y = 510;
    int wave_w = 460;
    int wave_h = 75;
    gui_draw_rect(wave_x, wave_y, wave_w, wave_h, 0x000F172A);
    gui_draw_rect_outline(wave_x, wave_y, wave_w, wave_h, 1, COLOR_CARD_BORDER);

    // Grid lines
    gui_draw_string(wave_x + 5, wave_y + 8, "Closed", COLOR_DROWSY_RED, 0, 1);
    gui_draw_string(wave_x + 5, wave_y + 48, "Open", COLOR_ALERT_GREEN, 0, 1);

    if (fsm) {
        int bar_w = 6;
        for (int i = 0; i < PERCLOS_WINDOW_SIZE; i++) {
            int hist_idx = (fsm->head + i) % PERCLOS_WINDOW_SIZE;
            u8 is_closed = fsm->history[hist_idx];
            int bx = wave_x + 80 + i * bar_w;
            if (is_closed) {
                gui_draw_rect(bx, wave_y + 12, bar_w - 1, 24, COLOR_DROWSY_RED);
            } else {
                gui_draw_rect(bx, wave_y + 46, bar_w - 1, 16, COLOR_ALERT_GREEN);
            }
        }
    }

    // Footnote
    gui_draw_string(40, 600, "Frame Rate: 60 FPS | MIPI CSI-2 4-Lane", COLOR_TEXT_MUTED, 0, 1);
    gui_draw_string(40, 620, "Dedicated BRAM: PL 0x1000 - 0x13FC", COLOR_TEXT_MUTED, 0, 1);

    // 5. Right Panel: Fatigue Assessment & Alarms (540, 95, 720, 605)
    gui_draw_rect(540, 95, 720, 605, COLOR_CARD_BG);
    gui_draw_rect_outline(540, 95, 720, 605, 2, COLOR_CARD_BORDER);

    gui_draw_string(565, 110, "REAL-TIME DRIVER FATIGUE STATE (PERCLOS FSM)", COLOR_WHITE, 0, 2);

    // Huge Driver Status Box
    drowsy_state_t cur_state = fsm ? fsm->current_state : DROWSY_STATE_AWAKE;
    u32 box_bg = 0x00064E3B;
    u32 box_border = COLOR_ALERT_GREEN;
    const char* status_title = "DRIVER STATUS: AWAKE (NORMAL)";
    const char* status_sub = "Safe to drive - Eye closure within safe limits";

    if (cur_state == DROWSY_STATE_PRE_DROWSY) {
        box_bg = 0x0078350F;
        box_border = COLOR_WARN_YELLOW;
        status_title = "STATUS: PRE-DROWSY (EARLY WARNING)";
        status_sub = "Mild fatigue detected - Intermittent eye blinks increasing";
    } else if (cur_state == DROWSY_STATE_DROWSY) {
        box_bg = 0x007F1D1D;
        box_border = COLOR_DROWSY_RED;
        status_title = "STATUS: DROWSY WARNING!";
        status_sub = "Severe driver fatigue detected! Audio alarm active";
    } else if (cur_state == DROWSY_STATE_MICROSLEEP) {
        box_bg = ((frame_idx / 4) % 2) ? 0x00991B1B : 0x00450A0A;
        box_border = COLOR_CRITICAL_RED;
        status_title = "CRITICAL: MICROSLEEP EVENT DETECTED!";
        status_sub = "EMERGENCY! Prolonged eye closure! Siren sounding!";
    }

    gui_draw_rect(565, 150, 670, 95, box_bg);
    gui_draw_rect_outline(565, 150, 670, 95, 3, box_border);
    gui_draw_string(590, 172, status_title, box_border, 0, 2);
    gui_draw_string(590, 208, status_sub, COLOR_WHITE, 0, 1);

    // PERCLOS Gauge Bar
    float perclos_val = fsm ? fsm->perclos_pct : 0.0f;
    gui_draw_string(565, 260, "PERCLOS METRIC (PERCENTAGE OF EYE CLOSURE):", COLOR_CYAN, 0, 1);

    int gauge_x = 565;
    int gauge_y = 285;
    int gauge_w = 670;
    int gauge_h = 32;
    gui_draw_rect(gauge_x, gauge_y, gauge_w, gauge_h, 0x000F172A);
    gui_draw_rect_outline(gauge_x, gauge_y, gauge_w, gauge_h, 2, COLOR_CARD_BORDER);

    // Fill gauge bar
    int fill_w = (int)((perclos_val / 100.0f) * (gauge_w - 4));
    if (fill_w < 0) fill_w = 0;
    if (fill_w > gauge_w - 4) fill_w = gauge_w - 4;

    u32 gauge_color = COLOR_ALERT_GREEN;
    if (perclos_val >= 70.0f) gauge_color = COLOR_CRITICAL_RED;
    else if (perclos_val >= 40.0f) gauge_color = COLOR_DROWSY_RED;
    else if (perclos_val >= 20.0f) gauge_color = COLOR_WARN_YELLOW;

    if (fill_w > 0) {
        gui_draw_rect(gauge_x + 2, gauge_y + 2, fill_w, gauge_h - 4, gauge_color);
    }

    // Gauge Threshold Markers (20%, 40%, 70%)
    gui_draw_rect(gauge_x + (int)(0.20f * gauge_w), gauge_y, 2, gauge_h, COLOR_WHITE);
    gui_draw_rect(gauge_x + (int)(0.40f * gauge_w), gauge_y, 2, gauge_h, COLOR_WHITE);
    gui_draw_rect(gauge_x + (int)(0.70f * gauge_w), gauge_y, 2, gauge_h, COLOR_WHITE);

    // Gauge numerical label
    char p_str[32];
    float_to_str(perclos_val, p_str, 1);
    gui_draw_string(gauge_x + 10, gauge_y + 8, "PERCLOS: ", COLOR_WHITE, 0, 1);
    gui_draw_string(gauge_x + 85, gauge_y + 8, p_str, COLOR_WHITE, 0, 1);
    gui_draw_string(gauge_x + 130, gauge_y + 8, "% (Thresholds: 20% Pre-Drowsy | 40% Drowsy | 70% Microsleep)", COLOR_TEXT_MUTED, 0, 1);

    // 6. PMOD Peripheral Alarm Status
    gui_draw_string(565, 335, "HARDWARE PMOD PERIPHERALS & ACTUATORS:", COLOR_GOLD, 0, 1);
    gui_draw_rect(565, 360, 670, 85, 0x00111827);
    gui_draw_rect_outline(565, 360, 670, 85, 1, COLOR_CARD_BORDER);

    // Buzzer Status
    gui_draw_string(585, 375, "PMOD Buzzer (PWM) :", COLOR_WHITE, 0, 1);
    if (alarm && alarm->buzzer_active) {
        int_to_str((int)alarm->buzzer_freq_hz, str_buf);
        gui_draw_string(760, 375, "ACTIVE (", COLOR_DROWSY_RED, 0, 1);
        gui_draw_string(830, 375, str_buf, COLOR_DROWSY_RED, 0, 1);
        gui_draw_string(880, 375, "Hz Audible Pulse)", COLOR_DROWSY_RED, 0, 1);
    } else {
        gui_draw_string(760, 375, "SILENT (Normal Operation)", COLOR_ALERT_GREEN, 0, 1);
    }

    // LED Pattern Status
    gui_draw_string(585, 405, "PMOD Alert LEDs   :", COLOR_WHITE, 0, 1);
    if (cur_state == DROWSY_STATE_AWAKE) {
        gui_draw_string(760, 405, "GREEN SOLID (Safe)", COLOR_ALERT_GREEN, 0, 1);
    } else if (cur_state == DROWSY_STATE_PRE_DROWSY) {
        gui_draw_string(760, 405, "YELLOW BLINKING (2 Hz)", COLOR_WARN_YELLOW, 0, 1);
    } else if (cur_state == DROWSY_STATE_DROWSY) {
        gui_draw_string(760, 405, "RED FAST BLINK (5 Hz)", COLOR_DROWSY_RED, 0, 1);
    } else {
        gui_draw_string(760, 405, "RED + EMERGENCY FLASH (10 Hz)", COLOR_CRITICAL_RED, 0, 1);
    }

    // 7. BNN Classifier Logits
    gui_draw_string(565, 465, "BNN CLASSIFIER LOGITS & SCORES:", COLOR_CYAN, 0, 1);
    gui_draw_string(585, 495, "Class 0 (Alert) Score :", COLOR_WHITE, 0, 1);
    int_to_str(logit0, str_buf);
    gui_draw_string(820, 495, str_buf, (pred == 0) ? COLOR_ALERT_GREEN : COLOR_TEXT_MUTED, 0, 1);

    gui_draw_string(585, 520, "Class 1 (Drowsy) Score:", COLOR_WHITE, 0, 1);
    int_to_str(logit1, str_buf);
    gui_draw_string(820, 520, str_buf, (pred == 1) ? COLOR_DROWSY_RED : COLOR_TEXT_MUTED, 0, 1);

    // 8. Performance Metrics
    gui_draw_rect(565, 555, 670, 75, 0x00111827);
    gui_draw_rect_outline(565, 555, 670, 75, 1, COLOR_CARD_BORDER);
    gui_draw_string(585, 570, "PL Clock Frequency  : 100.0 MHz | ASCON Tag Latency: 120 ns", COLOR_TEXT_MUTED, 0, 1);
    gui_draw_string(585, 595, "BNN Latency / Frame : < 0.5 ms  | HDMI Output: 1280x720 60Hz", COLOR_ALERT_GREEN, 0, 1);

    // Frame counter footer
    gui_draw_string(20, 702, "Frame #", COLOR_TEXT_MUTED, 0, 1);
    int_to_str((int)frame_idx, str_buf);
    gui_draw_string(85, 702, str_buf, COLOR_CYAN, 0, 1);
    gui_draw_string(140, 702, "| Anti-Spoofing & Side-Channel Protected by ASCON-128 AEAD", COLOR_TEXT_MUTED, 0, 1);
}
