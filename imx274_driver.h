#ifndef IMX274_DRIVER_H
#define IMX274_DRIVER_H

#include "xil_types.h"
#include "xstatus.h"

// Base Addresses on ZCU106 AXI Bus (M_AXI_HPM0_LPD)
#ifndef CTRL_GPIO_BASEADDR
#define CTRL_GPIO_BASEADDR       0x800B0000
#endif

#ifndef FMCH_AXI_IIC_BASEADDR
#define FMCH_AXI_IIC_BASEADDR    0x80090000
#endif

#ifndef MIPI_RX_BASEADDR
#define MIPI_RX_BASEADDR         0x800C0000
#endif

#ifndef DEMOSAIC_BASEADDR
#define DEMOSAIC_BASEADDR        0x800D0000
#endif

#ifndef V_TPG_BASEADDR
#define V_TPG_BASEADDR           0x80070000
#endif

// I2C Addresses on ZCU106 & FMC HPC0 (J5)
#define I2C_MUX_U135_ADDR        0x75 // On-board TCA9548A U135 (FMC HPC0, FMC HPC1, SYSMON, DDR4)
#define I2C_MUX_U34_ADDR         0x74 // On-board TCA9548A U34 (EEPROM, Si5341, Si570)
#define I2C_MUX_ADDR_ZCU106      0x75
#define I2C_MUX_ADDR_ALT         0x74
#define I2C_MUX_CH_FMC_HPC0      0x01 // Port 0 (bit 0) routes to FMC HPC0 J5 on U135!
#define I2C_MUX_CH_FMC_HPC1      0x02 // Port 1 (bit 1) routes to FMC HPC1 J4 on U135!
#define FMC_EEPROM_I2C_ADDR      0x50 // FMC Module 24C02 IPMI EEPROM
#define CDCE913_I2C_ADDR         0x65 // TI CDCE913 Clock Generator
#define IMX274_I2C_ADDR          0x1A // Sony IMX274 Image Sensor

// Camera Resolution Modes
typedef enum {
    IMX274_MODE_1080P_60FPS = 0,
    IMX274_MODE_4K_30FPS    = 1,
    IMX274_MODE_720P_60FPS  = 2
} imx274_mode_t;

// Driver Control APIs
void cam_hw_reset(void);
int i2c_axi_probe(u8 chip_addr);
int i2c_axi_write_reg8(u8 chip_addr, u8 reg_addr, u8 data);
int i2c_axi_write_reg16(u8 chip_addr, u16 reg_addr, u8 data);
int i2c_axi_read_reg8(u8 chip_addr, u8 reg_addr, u8 *data);
int i2c_mux_select(u8 ch_mask);

void zcu106_periph_power_sequence(void);
int zcu106_enable_vadj_1v8(void);
int dp159_init(void);
void i2c_scan_channel(u8 ch_idx, const char* name);
u32 i2c_check_peripherals_zcu106(void);

int cdce913_init(void);
int imx274_init(imx274_mode_t mode);
int imx274_start_stream(void);
int imx274_stop_stream(void);
void imx274_probe_telemetry(void);

// Hardware Video Pipeline Control
int cam_i2c_init(void);
int mipi_rx_subsystem_init(void);
int demosaic_init(u32 width, u32 height);
int tpg_passthrough_init(u32 width, u32 height);
int tpg_colorbar_init(u32 width, u32 height);
int tpg_set_live_camera(u32 width, u32 height);
int tpg_set_colorbar(u32 width, u32 height);
int camera_pipeline_init_all(void);

#endif // IMX274_DRIVER_H
