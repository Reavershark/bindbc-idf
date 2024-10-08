module idf.soc.soc;

import idf.sdkconfig;

// #ifndef __ASSEMBLER__
// #include <stdint.h>
// #include "esp_assert.h"
// #endif

// #include <esp_bit_defs.h>

// #define PRO_CPU_NUM (0)
// #define APP_CPU_NUM (1)

enum SOC_MAX_CONTIGUOUS_RAM_SIZE = 0x400000; ///< Largest span of contiguous memory (DRAM or IRAM) in the address space

enum DR_REG_DPORT_BASE          = 0x3ff00000;
enum DR_REG_AES_BASE            = 0x3ff01000;
enum DR_REG_RSA_BASE            = 0x3ff02000;
enum DR_REG_SHA_BASE            = 0x3ff03000;
enum DR_REG_FLASH_MMU_TABLE_PRO = 0x3ff10000;
enum DR_REG_FLASH_MMU_TABLE_APP = 0x3ff12000;
enum DR_REG_DPORT_END           = 0x3ff13FFC;
enum DR_REG_UART_BASE           = 0x3ff40000;
enum DR_REG_SPI1_BASE           = 0x3ff42000;
enum DR_REG_SPI0_BASE           = 0x3ff43000;
enum DR_REG_GPIO_BASE           = 0x3ff44000;
enum DR_REG_GPIO_SD_BASE        = 0x3ff44f00;
enum DR_REG_FE2_BASE            = 0x3ff45000;
enum DR_REG_FE_BASE             = 0x3ff46000;
enum DR_REG_FRC_TIMER_BASE      = 0x3ff47000;
enum DR_REG_RTCCNTL_BASE        = 0x3ff48000;
enum DR_REG_RTCIO_BASE          = 0x3ff48400;
enum DR_REG_SENS_BASE           = 0x3ff48800;
enum DR_REG_RTC_I2C_BASE        = 0x3ff48C00;
enum DR_REG_IO_MUX_BASE         = 0x3ff49000;
enum DR_REG_HINF_BASE           = 0x3ff4B000;
enum DR_REG_UHCI1_BASE          = 0x3ff4C000;
enum DR_REG_I2S_BASE            = 0x3ff4F000;
enum DR_REG_UART1_BASE          = 0x3ff50000;
enum DR_REG_BT_BASE             = 0x3ff51000;
enum DR_REG_I2C_EXT_BASE        = 0x3ff53000;
enum DR_REG_UHCI0_BASE          = 0x3ff54000;
enum DR_REG_SLCHOST_BASE        = 0x3ff55000;
enum DR_REG_RMT_BASE            = 0x3ff56000;
enum DR_REG_PCNT_BASE           = 0x3ff57000;
enum DR_REG_SLC_BASE            = 0x3ff58000;
enum DR_REG_LEDC_BASE           = 0x3ff59000;
enum DR_REG_EFUSE_BASE          = 0x3ff5A000;
enum DR_REG_SPI_ENCRYPT_BASE    = 0x3ff5B000;
enum DR_REG_NRX_BASE            = 0x3ff5CC00;
enum DR_REG_BB_BASE             = 0x3ff5D000;
enum DR_REG_PWM0_BASE           = 0x3ff5E000;
enum DR_REG_TIMERGROUP0_BASE    = 0x3ff5F000;
enum DR_REG_TIMERGROUP1_BASE    = 0x3ff60000;
enum DR_REG_RTCMEM0_BASE        = 0x3ff61000;
enum DR_REG_RTCMEM1_BASE        = 0x3ff62000;
enum DR_REG_RTCMEM2_BASE        = 0x3ff63000;
enum DR_REG_SPI2_BASE           = 0x3ff64000;
enum DR_REG_SPI3_BASE           = 0x3ff65000;
enum DR_REG_SYSCON_BASE         = 0x3ff66000;
enum DR_REG_APB_CTRL_BASE       = 0x3ff66000; /* Old name for SYSCON, to be removed */
enum DR_REG_I2C1_EXT_BASE       = 0x3ff67000;
enum DR_REG_SDMMC_BASE          = 0x3ff68000;
enum DR_REG_EMAC_BASE           = 0x3ff69000;
enum DR_REG_CAN_BASE            = 0x3ff6B000;
enum DR_REG_PWM1_BASE           = 0x3ff6C000;
enum DR_REG_I2S1_BASE           = 0x3ff6D000;
enum DR_REG_UART2_BASE          = 0x3ff6E000;
enum PERIPHS_SPI_ENCRYPT_BASEADDR = DR_REG_SPI_ENCRYPT_BASE;

enum ETS_UNCACHED_ADDR(addr) = addr;
enum ETS_CACHED_ADDR(addr) = addr;

// #ifndef __ASSEMBLER__
    // #define IS_DPORT_REG(_r) (((_r) >= DR_REG_DPORT_BASE) && (_r) <= DR_REG_DPORT_END)

    // #if !defined( BOOTLOADER_BUILD ) && defined( CONFIG_ESP32_DPORT_WORKAROUND ) && defined( ESP_PLATFORM )
    //     #define ASSERT_IF_DPORT_REG(_r, OP)  TRY_STATIC_ASSERT(!IS_DPORT_REG(_r), (Cannot use OP for DPORT registers use DPORT_##OP));
    // #else
    //     #define ASSERT_IF_DPORT_REG(_r, OP)
    // #endif

    // //write value to register
    // #define REG_WRITE(_r, _v) ({                                                                                           \
    //             ASSERT_IF_DPORT_REG((_r), REG_WRITE);                                                                      \
    //             (*(volatile uint32_t *)(_r)) = (_v);                                                                       \
    //         })

    // //read value from register
    // #define REG_READ(_r) ({                                                                                                \
    //             ASSERT_IF_DPORT_REG((_r), REG_READ);                                                                       \
    //             (*(volatile uint32_t *)(_r));                                                                              \
    //         })

    // //get bit or get bits from register
    // #define REG_GET_BIT(_r, _b)  ({                                                                                        \
    //             ASSERT_IF_DPORT_REG((_r), REG_GET_BIT);                                                                    \
    //             (*(volatile uint32_t*)(_r) & (_b));                                                                        \
    //         })

    // //set bit or set bits to register
    // #define REG_SET_BIT(_r, _b)  ({                                                                                        \
    //             ASSERT_IF_DPORT_REG((_r), REG_SET_BIT);                                                                    \
    //             (*(volatile uint32_t*)(_r) |= (_b));                                                                       \
    //         })

    // //clear bit or clear bits of register
    // #define REG_CLR_BIT(_r, _b)  ({                                                                                        \
    //             ASSERT_IF_DPORT_REG((_r), REG_CLR_BIT);                                                                    \
    //             (*(volatile uint32_t*)(_r) &= ~(_b));                                                                      \
    //         })

    // //set bits of register controlled by mask
    // #define REG_SET_BITS(_r, _b, _m) ({                                                                                    \
    //             ASSERT_IF_DPORT_REG((_r), REG_SET_BITS);                                                                   \
    //             (*(volatile uint32_t*)(_r) = (*(volatile uint32_t*)(_r) & ~(_m)) | ((_b) & (_m)));                         \
    //         })

    // //get field from register, uses field _S & _V to determine mask
    // #define REG_GET_FIELD(_r, _f) ({                                                                                       \
    //             ASSERT_IF_DPORT_REG((_r), REG_GET_FIELD);                                                                  \
    //             ((REG_READ(_r) >> (_f##_S)) & (_f##_V));                                                                   \
    //         })

    // //set field of a register from variable, uses field _S & _V to determine mask
    // #define REG_SET_FIELD(_r, _f, _v) ({                                                                                   \
    //             ASSERT_IF_DPORT_REG((_r), REG_SET_FIELD);                                                                  \
    //             (REG_WRITE((_r),((REG_READ(_r) & ~((_f##_V) << (_f##_S)))|(((_v) & (_f##_V))<<(_f##_S)))));                \
    //         })

    // //get field value from a variable, used when _f is not left shifted by _f##_S
    // #define VALUE_GET_FIELD(_r, _f) (((_r) >> (_f##_S)) & (_f))

    // //get field value from a variable, used when _f is left shifted by _f##_S
    // #define VALUE_GET_FIELD2(_r, _f) (((_r) & (_f))>> (_f##_S))

    // //set field value to a variable, used when _f is not left shifted by _f##_S
    // #define VALUE_SET_FIELD(_r, _f, _v) ((_r)=(((_r) & ~((_f) << (_f##_S)))|((_v)<<(_f##_S))))

    // //set field value to a variable, used when _f is left shifted by _f##_S
    // #define VALUE_SET_FIELD2(_r, _f, _v) ((_r)=(((_r) & ~(_f))|((_v)<<(_f##_S))))

    // //generate a value from a field value, used when _f is not left shifted by _f##_S
    // #define FIELD_TO_VALUE(_f, _v) (((_v)&(_f))<<_f##_S)

    // //generate a value from a field value, used when _f is left shifted by _f##_S
    // #define FIELD_TO_VALUE2(_f, _v) (((_v)<<_f##_S) & (_f))

    // //read value from register
    // #define READ_PERI_REG(addr) ({                                                                                         \
    //             ASSERT_IF_DPORT_REG((addr), READ_PERI_REG);                                                                \
    //             (*((volatile uint32_t *)ETS_UNCACHED_ADDR(addr)));                                                         \
    //         })

    // //write value to register
    // #define WRITE_PERI_REG(addr, val) ({                                                                                   \
    //             ASSERT_IF_DPORT_REG((addr), WRITE_PERI_REG);                                                               \
    //             (*((volatile uint32_t *)ETS_UNCACHED_ADDR(addr))) = (uint32_t)(val);                                       \
    //         })

    // //clear bits of register controlled by mask
    // #define CLEAR_PERI_REG_MASK(reg, mask) ({                                                                              \
    //             ASSERT_IF_DPORT_REG((reg), CLEAR_PERI_REG_MASK);                                                           \
    //             WRITE_PERI_REG((reg), (READ_PERI_REG(reg)&(~(mask))));                                                     \
    //         })

    // //set bits of register controlled by mask
    // #define SET_PERI_REG_MASK(reg, mask) ({                                                                                \
    //             ASSERT_IF_DPORT_REG((reg), SET_PERI_REG_MASK);                                                             \
    //             WRITE_PERI_REG((reg), (READ_PERI_REG(reg)|(mask)));                                                        \
    //         })

    // //get bits of register controlled by mask
    // #define GET_PERI_REG_MASK(reg, mask) ({                                                                                \
    //             ASSERT_IF_DPORT_REG((reg), GET_PERI_REG_MASK);                                                             \
    //             (READ_PERI_REG(reg) & (mask));                                                                             \
    //         })

    // //get bits of register controlled by highest bit and lowest bit
    // #define GET_PERI_REG_BITS(reg, hipos,lowpos) ({                                                                        \
    //             ASSERT_IF_DPORT_REG((reg), GET_PERI_REG_BITS);                                                             \
    //             ((READ_PERI_REG(reg)>>(lowpos))&((1<<((hipos)-(lowpos)+1))-1));                                            \
    //         })

    // //set bits of register controlled by mask and shift
    // #define SET_PERI_REG_BITS(reg,bit_map,value,shift) ({                                                                  \
    //             ASSERT_IF_DPORT_REG((reg), SET_PERI_REG_BITS);                                                             \
    //             (WRITE_PERI_REG((reg),(READ_PERI_REG(reg)&(~((bit_map)<<(shift))))|(((value) & bit_map)<<(shift)) ));      \
    //         })

    // //get field of register
    // #define GET_PERI_REG_BITS2(reg, mask,shift) ({                                                                         \
    //             ASSERT_IF_DPORT_REG((reg), GET_PERI_REG_BITS2);                                                            \
    //             ((READ_PERI_REG(reg)>>(shift))&(mask));                                                                    \
    //         })

// #endif /* !__ASSEMBLER__ */

// Periheral Clock
enum APB_CLK_FREQ_ROM     = 26 * 1_000_000;
enum CPU_CLK_FREQ_ROM     = APB_CLK_FREQ_ROM;
enum CPU_CLK_FREQ         = APB_CLK_FREQ;     // this may be incorrect, please refer to ESP32_DEFAULT_CPU_FREQ_MHZ
enum APB_CLK_FREQ         = 80 * 1_000_000;   // unit: Hz
enum REF_CLK_FREQ         = 1_000_000;
enum UART_CLK_FREQ        = APB_CLK_FREQ;
enum WDT_CLK_FREQ         = APB_CLK_FREQ;
enum TIMER_CLK_FREQ       = 80_000_000 >> 4;  // 80MHz divided by 16
enum SPI_CLK_DIV          = 4;
enum TICKS_PER_US_ROM     = 26;               // CPU is 80MHz
enum GPIO_MATRIX_DELAY_NS = 25;

/* Overall memory map */
enum SOC_DROM_LOW         = 0x3F400000;
enum SOC_DROM_HIGH        = 0x3F800000;
enum SOC_DRAM_LOW         = 0x3FFAE000;
enum SOC_DRAM_HIGH        = 0x40000000;
enum SOC_IROM_LOW         = 0x400D0000;
enum SOC_IROM_HIGH        = 0x40400000;
enum SOC_IROM_MASK_LOW    = 0x40000000;
enum SOC_IROM_MASK_HIGH   = 0x40070000;
enum SOC_CACHE_PRO_LOW    = 0x40070000;
enum SOC_CACHE_PRO_HIGH   = 0x40078000;
enum SOC_CACHE_APP_LOW    = 0x40078000;
enum SOC_CACHE_APP_HIGH   = 0x40080000;
enum SOC_IRAM_LOW         = 0x40080000;
enum SOC_IRAM_HIGH        = 0x400A0000;
enum SOC_RTC_IRAM_LOW     = 0x400C0000;
enum SOC_RTC_IRAM_HIGH    = 0x400C2000;
enum SOC_RTC_DRAM_LOW     = 0x3FF80000;
enum SOC_RTC_DRAM_HIGH    = 0x3FF82000;
enum SOC_RTC_DATA_LOW     = 0x50000000;
enum SOC_RTC_DATA_HIGH    = 0x50002000;
enum SOC_EXTRAM_DATA_LOW  = 0x3F800000;
enum SOC_EXTRAM_DATA_HIGH = 0x3FC00000;

enum SOC_EXTRAM_DATA_SIZE = SOC_EXTRAM_DATA_HIGH - SOC_EXTRAM_DATA_LOW;

//First and last words of the D/IRAM region, for both the DRAM address as well as the IRAM alias.
enum SOC_DIRAM_IRAM_LOW  = 0x400A0000;
enum SOC_DIRAM_IRAM_HIGH = 0x400C0000;
enum SOC_DIRAM_DRAM_LOW  = 0x3FFE0000;
enum SOC_DIRAM_DRAM_HIGH = 0x40000000;
// Byte order of D/IRAM regions is reversed between accessing as DRAM or IRAM
enum SOC_DIRAM_INVERTED = 1;

// Region of memory accessible via DMA. See esp_ptr_dma_capable().
enum SOC_DMA_LOW  = 0x3FFAE000;
enum SOC_DMA_HIGH = 0x40000000;

// Region of memory that is byte-accessible. See esp_ptr_byte_accessible().
enum SOC_BYTE_ACCESSIBLE_LOW  = 0x3FF90000;
enum SOC_BYTE_ACCESSIBLE_HIGH = 0x40000000;

//Region of memory that is internal, as in on the same silicon die as the ESP32 CPUs
//(excluding RTC data region, that's checked separately.) See esp_ptr_internal().
enum SOC_MEM_INTERNAL_LOW  = 0x3FF90000;
enum SOC_MEM_INTERNAL_HIGH = 0x400C2000;

// Start (highest address) of ROM boot stack, only relevant during early boot
enum SOC_ROM_STACK_START = 0x3ffe3f20;

// Interrupt hardware source table
// This table is decided by hardware, don't touch this.
enum ETS_WIFI_MAC_INTR_SOURCE       = 0; /**< interrupt of WiFi MAC, level*/
enum ETS_WIFI_MAC_NMI_SOURCE        = 1; /**< interrupt of WiFi MAC, NMI, use if MAC have bug to fix in NMI*/
enum ETS_WIFI_BB_INTR_SOURCE        = 2; /**< interrupt of WiFi BB, level, we can do some calibartion*/
enum ETS_BT_MAC_INTR_SOURCE         = 3; /**< will be cancelled*/
enum ETS_BT_BB_INTR_SOURCE          = 4; /**< interrupt of BT BB, level*/
enum ETS_BT_BB_NMI_SOURCE           = 5; /**< interrupt of BT BB, NMI, use if BB have bug to fix in NMI*/
enum ETS_RWBT_INTR_SOURCE           = 6; /**< interrupt of RWBT, level*/
enum ETS_RWBLE_INTR_SOURCE          = 7; /**< interrupt of RWBLE, level*/
enum ETS_RWBT_NMI_SOURCE            = 8; /**< interrupt of RWBT, NMI, use if RWBT have bug to fix in NMI*/
enum ETS_RWBLE_NMI_SOURCE           = 9; /**< interrupt of RWBLE, NMI, use if RWBT have bug to fix in NMI*/
enum ETS_SLC0_INTR_SOURCE           = 10; /**< interrupt of SLC0, level*/
enum ETS_SLC1_INTR_SOURCE           = 11; /**< interrupt of SLC1, level*/
enum ETS_UHCI0_INTR_SOURCE          = 12; /**< interrupt of UHCI0, level*/
enum ETS_UHCI1_INTR_SOURCE          = 13; /**< interrupt of UHCI1, level*/
enum ETS_TG0_T0_LEVEL_INTR_SOURCE   = 14; /**< interrupt of TIMER_GROUP0, TIMER0, level, we would like use EDGE for timer if permission*/
enum ETS_TG0_T1_LEVEL_INTR_SOURCE   = 15; /**< interrupt of TIMER_GROUP0, TIMER1, level, we would like use EDGE for timer if permission*/
enum ETS_TG0_WDT_LEVEL_INTR_SOURCE  = 16; /**< interrupt of TIMER_GROUP0, WATCHDOG, level*/
enum ETS_TG0_LACT_LEVEL_INTR_SOURCE = 17; /**< interrupt of TIMER_GROUP0, LACT, level*/
enum ETS_TG1_T0_LEVEL_INTR_SOURCE   = 18; /**< interrupt of TIMER_GROUP1, TIMER0, level, we would like use EDGE for timer if permission*/
enum ETS_TG1_T1_LEVEL_INTR_SOURCE   = 19; /**< interrupt of TIMER_GROUP1, TIMER1, level, we would like use EDGE for timer if permission*/
enum ETS_TG1_WDT_LEVEL_INTR_SOURCE  = 20; /**< interrupt of TIMER_GROUP1, WATCHDOG, level*/
enum ETS_TG1_LACT_LEVEL_INTR_SOURCE = 21; /**< interrupt of TIMER_GROUP1, LACT, level*/
enum ETS_GPIO_INTR_SOURCE           = 22; /**< interrupt of GPIO, level*/
enum ETS_GPIO_NMI_SOURCE            = 23; /**< interrupt of GPIO, NMI*/
enum ETS_FROM_CPU_INTR0_SOURCE      = 24; /**< interrupt0 generated from a CPU, level*/ /* Used for FreeRTOS */
enum ETS_FROM_CPU_INTR1_SOURCE      = 25; /**< interrupt1 generated from a CPU, level*/ /* Used for FreeRTOS */
enum ETS_FROM_CPU_INTR2_SOURCE      = 26; /**< interrupt2 generated from a CPU, level*/ /* Used for IPC_ISR */
enum ETS_FROM_CPU_INTR3_SOURCE      = 27; /**< interrupt3 generated from a CPU, level*/ /* Used for IPC_ISR */
enum ETS_SPI0_INTR_SOURCE           = 28; /**< interrupt of SPI0, level, SPI0 is for Cache Access, do not use this*/
enum ETS_SPI1_INTR_SOURCE           = 29; /**< interrupt of SPI1, level, SPI1 is for flash read/write, do not use this*/
enum ETS_SPI2_INTR_SOURCE           = 30; /**< interrupt of SPI2, level*/
enum ETS_SPI3_INTR_SOURCE           = 31; /**< interrupt of SPI3, level*/
enum ETS_I2S0_INTR_SOURCE           = 32; /**< interrupt of I2S0, level*/
enum ETS_I2S1_INTR_SOURCE           = 33; /**< interrupt of I2S1, level*/
enum ETS_UART0_INTR_SOURCE          = 34; /**< interrupt of UART0, level*/
enum ETS_UART1_INTR_SOURCE          = 35; /**< interrupt of UART1, level*/
enum ETS_UART2_INTR_SOURCE          = 36; /**< interrupt of UART2, level*/
enum ETS_SDIO_HOST_INTR_SOURCE      = 37; /**< interrupt of SD/SDIO/MMC HOST, level*/
enum ETS_ETH_MAC_INTR_SOURCE        = 38; /**< interrupt of ethernet mac, level*/
enum ETS_PWM0_INTR_SOURCE           = 39; /**< interrupt of PWM0, level, Reserved*/
enum ETS_PWM1_INTR_SOURCE           = 40; /**< interrupt of PWM1, level, Reserved*/
enum ETS_LEDC_INTR_SOURCE           = 43; /**< interrupt of LED PWM, level*/
enum ETS_EFUSE_INTR_SOURCE          = 44; /**< interrupt of efuse, level, not likely to use*/
enum ETS_TWAI_INTR_SOURCE           = 45; /**< interrupt of twai, level*/
enum ETS_CAN_INTR_SOURCE            = ETS_TWAI_INTR_SOURCE;
enum ETS_RTC_CORE_INTR_SOURCE       = 46; /**< interrupt of rtc core, level, include rtc watchdog*/
enum ETS_RMT_INTR_SOURCE            = 47; /**< interrupt of remote controller, level*/
enum ETS_PCNT_INTR_SOURCE           = 48; /**< interrupt of pluse count, level*/
enum ETS_I2C_EXT0_INTR_SOURCE       = 49; /**< interrupt of I2C controller1, level*/
enum ETS_I2C_EXT1_INTR_SOURCE       = 50; /**< interrupt of I2C controller0, level*/
enum ETS_RSA_INTR_SOURCE            = 51; /**< interrupt of RSA accelerator, level*/
enum ETS_SPI1_DMA_INTR_SOURCE       = 52; /**< interrupt of SPI1 DMA, SPI1 is for flash read/write, do not use this*/
enum ETS_SPI2_DMA_INTR_SOURCE       = 53; /**< interrupt of SPI2 DMA, level*/
enum ETS_SPI3_DMA_INTR_SOURCE       = 54; /**< interrupt of SPI3 DMA, level*/
enum ETS_WDT_INTR_SOURCE            = 55; /**< will be cancelled*/
enum ETS_TIMER1_INTR_SOURCE         = 56; /**< will be cancelled*/
enum ETS_TIMER2_INTR_SOURCE         = 57; /**< will be cancelled*/
enum ETS_TG0_T0_EDGE_INTR_SOURCE    = 58; /**< interrupt of TIMER_GROUP0, TIMER0, EDGE*/
enum ETS_TG0_T1_EDGE_INTR_SOURCE    = 59; /**< interrupt of TIMER_GROUP0, TIMER1, EDGE*/
enum ETS_TG0_WDT_EDGE_INTR_SOURCE   = 60; /**< interrupt of TIMER_GROUP0, WATCH DOG, EDGE*/
enum ETS_TG0_LACT_EDGE_INTR_SOURCE  = 61; /**< interrupt of TIMER_GROUP0, LACT, EDGE*/
enum ETS_TG1_T0_EDGE_INTR_SOURCE    = 62; /**< interrupt of TIMER_GROUP1, TIMER0, EDGE*/
enum ETS_TG1_T1_EDGE_INTR_SOURCE    = 63; /**< interrupt of TIMER_GROUP1, TIMER1, EDGE*/
enum ETS_TG1_WDT_EDGE_INTR_SOURCE   = 64; /**< interrupt of TIMER_GROUP1, WATCHDOG, EDGE*/
enum ETS_TG1_LACT_EDGE_INTR_SOURCE  = 65; /**< interrupt of TIMER_GROUP0, LACT, EDGE*/
enum ETS_MMU_IA_INTR_SOURCE         = 66; /**< interrupt of MMU Invalid Access, LEVEL*/
enum ETS_MPU_IA_INTR_SOURCE         = 67; /**< interrupt of MPU Invalid Access, LEVEL*/
enum ETS_CACHE_IA_INTR_SOURCE       = 68; /**< interrupt of Cache Invalied Access, LEVEL*/
enum ETS_MAX_INTR_SOURCE            = 69; /**< total number of interrupt sources*/

static if (is(typeof(CONFIG_ESP_SYSTEM_CHECK_INT_LEVEL_5)))
{
    //interrupt cpu using table, Please see the core-isa.h
    /*************************************************************************************************************
     *      Intr num                Level           Type                    PRO CPU usage           APP CPU uasge
     *      0                       1               extern level            WMAC                    Reserved
     *      1                       1               extern level            BT/BLE Host HCI DMA     BT/BLE Host HCI DMA
     *      2                       1               extern level
     *      3                       1               extern level
     *      4                       1               extern level            WBB
     *      5                       1               extern level
     *      6                       1               timer                   FreeRTOS Tick(L1)       FreeRTOS Tick(L1)
     *      7                       1               software                BT/BLE VHCI             BT/BLE VHCI
     *      8                       1               extern level            BT/BLE BB(RX/TX)        BT/BLE BB(RX/TX)
     *      9                       1               extern level
     *      10                      1               extern edge
     *      11                      3               profiling
     *      12                      1               extern level
     *      13                      1               extern level
     *      14                      7               nmi                     Reserved                Reserved
     *      15                      3               timer                   FreeRTOS Tick(L3)       FreeRTOS Tick(L3)
     *      16                      5               timer                   Reserved                Reserved
     *      17                      1               extern level
     *      18                      1               extern level
     *      19                      2               extern level
     *      20                      2               extern level
     *      21                      2               extern level
     *      22                      3               extern edge
     *      23                      3               extern level
     *      24                      4               extern level
     *      25                      4               extern level            BT/BLE Controller       BT/BLE Controller
     *      26                      5               extern level            TG1_WDT & CACHEERR
     *      27                      3               extern level            Reserved                Reserved
     *      28                      4               extern edge
     *      29                      3               software                BT/BLE hli              BT/BLE hli
     *      30                      4               extern edge             Reserved                Reserved
     *      31                      5               extern level            IPC_ISR                 IPC_ISR
     *************************************************************************************************************
     */

    //CPU0 Interrupt number reserved, not touch this.
    enum ETS_WMAC_INUM            = 0;
    enum ETS_BT_HOST_INUM         = 1;
    enum ETS_WBB_INUM             = 4;
    enum ETS_TG0_T1_INUM          = 10; /**< use edge interrupt*/
    enum ETS_FRC1_INUM            = 22;
    enum ETS_T1_WDT_CACHEERR_INUM = 26;
    enum ETS_T1_WDT_INUM          = ETS_T1_WDT_CACHEERR_INUM;
    enum ETS_MEMACCESS_ERR_INUM   = ETS_T1_WDT_CACHEERR_INUM;
    /* backwards compatibility only, use ETS_MEMACCESS_ERR_INUM instead*/
    enum ETS_CACHEERR_INUM        = ETS_MEMACCESS_ERR_INUM;
    enum ETS_IPC_ISR_INUM         = 31;
}
else static if (is(typeof(CONFIG_ESP_SYSTEM_CHECK_INT_LEVEL_4)))
{
    //interrupt cpu using table, Please see the core-isa.h
    /*************************************************************************************************************
     *      Intr num                Level           Type                    PRO CPU usage           APP CPU uasge
     *      0                       1               extern level            WMAC                    Reserved
     *      1                       1               extern level            BT/BLE Host HCI DMA     BT/BLE Host HCI DMA
     *      2                       1               extern level
     *      3                       1               extern level
     *      4                       1               extern level            WBB
     *      5                       1               extern level            BT/BLE Controller       BT/BLE Controller
     *      6                       1               timer                   FreeRTOS Tick(L1)       FreeRTOS Tick(L1)
     *      7                       1               software                BT/BLE VHCI             BT/BLE VHCI
     *      8                       1               extern level            BT/BLE BB(RX/TX)        BT/BLE BB(RX/TX)
     *      9                       1               extern level
     *      10                      1               extern edge
     *      11                      3               profiling
     *      12                      1               extern level
     *      13                      1               extern level
     *      14                      7               nmi                     Reserved                Reserved
     *      15                      3               timer                   FreeRTOS Tick(L3)       FreeRTOS Tick(L3)
     *      16                      5               timer
     *      17                      1               extern level
     *      18                      1               extern level
     *      19                      2               extern level
     *      20                      2               extern level
     *      21                      2               extern level
     *      22                      3               extern edge
     *      23                      3               extern level
     *      24                      4               extern level            TG1_WDT
     *      25                      4               extern level            CACHEERR
     *      26                      5               extern level
     *      27                      3               extern level            Reserved                Reserved
     *      28                      4               extern edge             IPC_ISR                 IPC_ISR
     *      29                      3               software                Reserved                Reserved
     *      30                      4               extern edge             Reserved                Reserved
     *      31                      5               extern level
     *************************************************************************************************************
     */

    //CPU0 Interrupt number reserved, not touch this.
    enum ETS_WMAC_INUM          = 0;
    enum ETS_BT_HOST_INUM       = 1;
    enum ETS_WBB_INUM           = 4;
    enum ETS_TG0_T1_INUM        = 10; /**< use edge interrupt*/
    enum ETS_FRC1_INUM          = 22;
    enum ETS_T1_WDT_INUM        = 24;
    enum ETS_MEMACCESS_ERR_INUM = 25;
    /* backwards compatibility only, use ETS_MEMACCESS_ERR_INUM instead*/
    enum ETS_CACHEERR_INUM      = ETS_MEMACCESS_ERR_INUM;
    enum ETS_IPC_ISR_INUM       = 28;
}

//CPU0 Interrupt number used in ROM, should be cancelled in SDK
enum ETS_SLC_INUM   = 1;
enum ETS_UART0_INUM = 5;
enum ETS_UART1_INUM = 5;
//Other interrupt number should be managed by the user

//Invalid interrupt for number interrupt matrix
enum ETS_INVALID_INUM = 6;