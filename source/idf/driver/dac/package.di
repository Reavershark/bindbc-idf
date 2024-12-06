module idf.driver.dac;

import idf.esp_common.esp_err : esp_err_t;

@safe nothrow @nogc extern (C):

/**
 * Enable DAC output data from I2S
 *
 * Returns: ESP_OK success
 */
esp_err_t dac_i2s_enable();

/**
 * Disable DAC output data from I2S
 *
 * Returns: ESP_OK success
 */
esp_err_t dac_i2s_disable();
