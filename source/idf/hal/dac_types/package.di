module idf.hal.dac_types;

import idf.sdkconfig;

@safe nothrow @nogc extern (C):

enum dac_channel_t
{
    DAC_CHANNEL_1 = 0, /// DAC channel 1 is GPIO25(ESP32) / GPIO17(ESP32S2)
    DAC_CHANNEL_2 = 1, /// DAC channel 2 is GPIO26(ESP32) / GPIO18(ESP32S2)
    DAC_CHANNEL_MAX,
}

/// The multiple of the amplitude of the cosine wave generator. The max amplitude is VDD3P3_RTC.
enum dac_cw_scale_t
{
    DAC_CW_SCALE_1 = 0x0, /// 1/1.
    DAC_CW_SCALE_2 = 0x1, /// 1/2.
    DAC_CW_SCALE_4 = 0x2, /// 1/4.
    DAC_CW_SCALE_8 = 0x3, /// 1/8.
}

/// Set the phase of the cosine wave generator output.
enum dac_cw_phase_t
{
    DAC_CW_PHASE_0 = 0x2, /// Phase shift +0°
    DAC_CW_PHASE_180 = 0x3, /// Phase shift +180°
}

/// Config the cosine wave generator function in DAC module.
struct dac_cw_config_t
{
    /// Enable the cosine wave generator of DAC channel.
    dac_channel_t en_ch;
    /// Set the amplitude of the cosine wave generator output.
    dac_cw_scale_t scale;
    /// Set the phase of the cosine wave generator output.
    dac_cw_phase_t phase;
    /// Set frequency of cosine wave generator output. Range: 130(130Hz) ~ 55000(100KHz).
    uint freq;
    /** 
     * Set the voltage value of the DC component of the cosine wave generator output.
     * Note: Unreasonable settings can cause waveform to be oversaturated. Range: -128 ~ 127.
     */
    byte offset;
}

static if (is(typeof(CONFIG_IDF_TARGET_ESP32S2)) || is(typeof(CONFIG_IDF_TARGET_ESP32S3)))
{

    /// DAC digital controller (DMA mode) work mode.
    enum dac_digi_convert_mode_t
    {
        DAC_CONV_NORMAL, /// The data in the DMA buffer is simultaneously output to the enable channel of the DAC.
        DAC_CONV_ALTER, /// The data in the DMA buffer is alternately output to the enable channel of the DAC.
        DAC_CONV_MAX
    }

    /+
    /// DAC digital controller (DMA mode) configuration parameters.
    struct dac_digi_config_t
    {
        /// DAC digital controller (DMA mode) work mode. See ``dac_digi_convert_mode_t``.
        dac_digi_convert_mode_t mode;
        /**
         * The number of interval clock cycles for the DAC digital controller to output voltage.
         * The unit is the divided clock. Range: 1 ~ 4095.
         * Expression: `dac_output_freq` = `controller_clk` / interval. Refer to ``adc_digi_clk_t``.
         * Note: The sampling rate of each channel is also related to the conversion mode (See ``dac_digi_convert_mode_t``) and pattern table settings.
         */
        uint interval;
        /**
         * DAC digital controller clock divider settings. Refer to ``adc_digi_clk_t``.
         * Note: The clocks of the DAC digital controller use the ADC digital controller clock divider.
         */
        adc_digi_clk_t dig_clk;
    }
    +/
}
