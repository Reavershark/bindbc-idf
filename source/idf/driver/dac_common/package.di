module idf.driver.dac_common;

import idf.esp_common.esp_err : esp_err_t;
import idf.hal.dac_types;
import idf.hal.gpio_types;

@safe nothrow @nogc extern (C):

/**
 * @brief Get the GPIO number of a specific DAC channel.
 *
 * @param channel Channel to get the gpio number
 * @param gpio_num output buffer to hold the gpio number
 * @return
 *   - ESP_OK if success
 */
esp_err_t dac_pad_get_io_num(dac_channel_t channel, gpio_num_t* gpio_num);

/**
 * @brief Set DAC output voltage.
 *        DAC output is 8-bit. Maximum (255) corresponds to VDD3P3_RTC.
 *
 * @note Need to configure DAC pad before calling this function.
 *       DAC channel 1 is attached to GPIO25, DAC channel 2 is attached to GPIO26
 * @param channel DAC channel
 * @param dac_value DAC output value
 *
 * @return
 *     - ESP_OK success
 */
esp_err_t dac_output_voltage(dac_channel_t channel, ubyte dac_value);

/**
 * @brief DAC pad output enable
 *
 * @param channel DAC channel
 * @note DAC channel 1 is attached to GPIO25, DAC channel 2 is attached to GPIO26
 *       I2S left channel will be mapped to DAC channel 2
 *       I2S right channel will be mapped to DAC channel 1
 */
esp_err_t dac_output_enable(dac_channel_t channel);

/**
 * @brief DAC pad output disable
 *
 * @param channel DAC channel
 * @note DAC channel 1 is attached to GPIO25, DAC channel 2 is attached to GPIO26
 * @return
 *     - ESP_OK success
 */
esp_err_t dac_output_disable(dac_channel_t channel);

/**
 * @brief Enable cosine wave generator output.
 *
 * @return
 *     - ESP_OK success
 */
esp_err_t dac_cw_generator_enable();

/**
 * @brief Disable cosine wave generator output.
 *
 * @return
 *     - ESP_OK success
 */
esp_err_t dac_cw_generator_disable();

/**
 * @brief Config the cosine wave generator function in DAC module.
 *
 * @param cw Configuration.
 * @return
 *     - ESP_OK success
 *     - ESP_ERR_INVALID_ARG The parameter is NULL.
 */
esp_err_t dac_cw_generator_config(dac_cw_config_t* cw);
