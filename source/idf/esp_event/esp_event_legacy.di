module idf.esp_event.esp_event_legacy;

import idf.esp_common.esp_err : esp_err_t;
import idf.esp_event.esp_event_base : esp_event_base_t;
import idf.esp_netif.esp_netif_types;
import idf.esp_wifi.esp_wifi_types;
import idf.freertos : TickType_t;

@safe nothrow @nogc extern (C):

// #include <stdint.h>
// #include <stdbool.h>

// #include "esp_err.h"
// #include "esp_wifi_types.h"
// #include "esp_netif.h"

// dfmt off
/// System event types enumeration
enum system_event_id_t
{
    SYSTEM_EVENT_WIFI_READY = 0,         /// ESP32 WiFi ready
    SYSTEM_EVENT_SCAN_DONE,              /// ESP32 finish scanning AP
    SYSTEM_EVENT_STA_START,              /// ESP32 station start
    SYSTEM_EVENT_STA_STOP,               /// ESP32 station stop
    SYSTEM_EVENT_STA_CONNECTED,          /// ESP32 station connected to AP
    SYSTEM_EVENT_STA_DISCONNECTED,       /// ESP32 station disconnected from AP
    SYSTEM_EVENT_STA_AUTHMODE_CHANGE,    /// The auth mode of AP connected by ESP32 station changed
    SYSTEM_EVENT_STA_GOT_IP,             /// ESP32 station got IP from connected AP
    SYSTEM_EVENT_STA_LOST_IP,            /// ESP32 station lost IP and the IP is reset to 0
    SYSTEM_EVENT_STA_BSS_RSSI_LOW,       /// ESP32 station connected BSS rssi goes below threshold
    SYSTEM_EVENT_STA_WPS_ER_SUCCESS,     /// ESP32 station wps succeeds in enrollee mode
    SYSTEM_EVENT_STA_WPS_ER_FAILED,      /// ESP32 station wps fails in enrollee mode
    SYSTEM_EVENT_STA_WPS_ER_TIMEOUT,     /// ESP32 station wps timeout in enrollee mode
    SYSTEM_EVENT_STA_WPS_ER_PIN,         /// ESP32 station wps pin code in enrollee mode
    SYSTEM_EVENT_STA_WPS_ER_PBC_OVERLAP, /// ESP32 station wps overlap in enrollee mode
    SYSTEM_EVENT_AP_START,               /// ESP32 soft-AP start
    SYSTEM_EVENT_AP_STOP,                /// ESP32 soft-AP stop
    SYSTEM_EVENT_AP_STACONNECTED,        /// A station connected to ESP32 soft-AP
    SYSTEM_EVENT_AP_STADISCONNECTED,     /// A station disconnected from ESP32 soft-AP
    SYSTEM_EVENT_AP_STAIPASSIGNED,       /// ESP32 soft-AP assign an IP to a connected station
    SYSTEM_EVENT_AP_PROBEREQRECVED,      /// Receive probe request packet in soft-AP interface
    SYSTEM_EVENT_ACTION_TX_STATUS,       /// Receive status of Action frame transmitted
    SYSTEM_EVENT_ROC_DONE,               /// Indicates the completion of Remain-on-Channel operation status
    SYSTEM_EVENT_STA_BEACON_TIMEOUT,     /// ESP32 station beacon timeout
    SYSTEM_EVENT_FTM_REPORT,             /// Receive report of FTM procedure
    SYSTEM_EVENT_GOT_IP6,                /// ESP32 station or ap or ethernet interface v6IP addr is preferred
    SYSTEM_EVENT_ETH_START,              /// ESP32 ethernet start
    SYSTEM_EVENT_ETH_STOP,               /// ESP32 ethernet stop
    SYSTEM_EVENT_ETH_CONNECTED,          /// ESP32 ethernet phy link up
    SYSTEM_EVENT_ETH_DISCONNECTED,       /// ESP32 ethernet phy link down
    SYSTEM_EVENT_ETH_GOT_IP,             /// ESP32 ethernet got IP from connected AP
    SYSTEM_EVENT_ETH_LOST_IP,            /// ESP32 ethernet lost IP and the IP is reset to 0
    SYSTEM_EVENT_MAX,                    /// Number of members in this enum

    SYSTEM_EVENT_AP_STA_GOT_IP6 = SYSTEM_EVENT_GOT_IP6, /// For compatibility with old IDF versions
}
// dfmt on

/// Argument structure of SYSTEM_EVENT_STA_WPS_ER_FAILED event
alias system_event_sta_wps_fail_reason_t = wifi_event_sta_wps_fail_reason_t;

/// Argument structure of SYSTEM_EVENT_SCAN_DONE event
alias system_event_sta_scan_done_t = wifi_event_sta_scan_done_t;

/// Argument structure of SYSTEM_EVENT_STA_CONNECTED event
alias system_event_sta_connected_t = wifi_event_sta_connected_t;

/// Argument structure of SYSTEM_EVENT_STA_DISCONNECTED event
alias system_event_sta_disconnected_t = wifi_event_sta_disconnected_t;

/// Argument structure of SYSTEM_EVENT_STA_AUTHMODE_CHANGE event
alias system_event_sta_authmode_change_t = wifi_event_sta_authmode_change_t;

/// Argument structure of SYSTEM_EVENT_STA_WPS_ER_PIN event
alias system_event_sta_wps_er_pin_t = wifi_event_sta_wps_er_pin_t;

/// Argument structure of SYSTEM_EVENT_STA_WPS_ER_PIN event
alias system_event_sta_wps_er_success_t = wifi_event_sta_wps_er_success_t;

/// Argument structure of [missing] event
alias system_event_ap_staconnected_t = wifi_event_ap_staconnected_t;

/// Argument structure of [missing] event
alias system_event_ap_stadisconnected_t = wifi_event_ap_stadisconnected_t;

/// Argument structure of [missing] event
alias system_event_ap_probe_req_rx_t = wifi_event_ap_probe_req_rx_t;

/** Argument structure of SYSTEM_EVENT_FTM_REPORT event */
alias system_event_ftm_report_t = wifi_event_ftm_report_t;

/** Argument structure of [missing] event */
alias system_event_ap_staipassigned_t = ip_event_ap_staipassigned_t;

/** Argument structure of [missing] event */
alias system_event_sta_got_ip_t = ip_event_got_ip_t;

/** Argument structure of [missing] event */
alias system_event_got_ip6_t = ip_event_got_ip6_t;

// dfmt off
/// Union of all possible system_event argument structures
union system_event_info_t
{
    system_event_sta_connected_t       connected;          /// ESP32 station connected to AP
    system_event_sta_disconnected_t    disconnected;       /// ESP32 station disconnected to AP
    system_event_sta_scan_done_t       scan_done;          /// ESP32 station scan (APs) done
    system_event_sta_authmode_change_t auth_change;        /// The auth mode of AP ESP32 station connected to changed
    system_event_sta_got_ip_t          got_ip;             /// ESP32 station got IP, first time got IP or when IP is changed
    system_event_sta_wps_er_pin_t      sta_er_pin;         /// ESP32 station WPS enrollee mode PIN code received
    system_event_sta_wps_fail_reason_t sta_er_fail_reason; /// ESP32 station WPS enrollee mode failed reason code received
    system_event_sta_wps_er_success_t  sta_er_success;     /// ESP32 station WPS enrollee success
    system_event_ap_staconnected_t     sta_connected;      /// A station connected to ESP32 soft-AP
    system_event_ap_stadisconnected_t  sta_disconnected;   /// A station disconnected to ESP32 soft-AP
    system_event_ap_probe_req_rx_t     ap_probereqrecved;  /// ESP32 soft-AP receive probe request packet
    system_event_ftm_report_t          ftm_report;         /// Report of FTM procedure
    system_event_ap_staipassigned_t    ap_staipassigned;   /// ESP32 soft-AP assign an IP to the statio
    system_event_got_ip6_t             got_ip6;            /// ESP32 station　or ap or ethernet ipv6 addr state change to preferred
}
// dfmt on

// dfmt off
/// Event, as a tagged enum
struct system_event_t
{
    system_event_id_t   event_id;   /*!< event ID */
    system_event_info_t event_info; /*!< event information */
}
// dfmt on

/// Event handler function type
alias system_event_handler_t = esp_err_t function(
    esp_event_base_t event_base, int event_id, void* event_data, size_t event_data_size,
    TickType_t ticks_to_wait,
);

/**
 * @brief  Application specified event callback function
 *
 * @note This API is part of the legacy event system. New code should use event library API in esp_event.h
 *
 *
 * @param  ctx    reserved for user
 * @param  event  event type defined in this file
 *
 * @return
 *    - ESP_OK: succeed
 *    - others: fail
 */
alias system_event_cb_t = esp_err_t function(void* ctx, system_event_t* event);

/**
  * @brief  Send a event to event task
  *
  * @note This API is part of the legacy event system. New code should use event library API in esp_event.h
  *
  * Other task/modules, such as the tcpip_adapter, can call this API to send an event to event task
  *
  * @param event Event to send
  *
  * @return ESP_OK : succeed
  * @return others : fail
  */
deprecated
esp_err_t esp_event_send(system_event_t* event);

/**
  * @brief  Send a event to event task
  *
  * @note This API is used by WiFi Driver only.
  *
  * Other task/modules, such as the tcpip_adapter, can call this API to send an event to event task
  *
  * @param[in] event_base the event base that identifies the event
  * @param[in] event_id the event id that identifies the event
  * @param[in] event_data the data, specific to the event occurence, that gets passed to the handler
  * @param[in] event_data_size the size of the event data
  * @param[in] ticks_to_wait number of ticks to block on a full event queue
  *
  * @return ESP_OK : succeed
  * @return others : fail
  */
esp_err_t esp_event_send_internal(
    esp_event_base_t event_base, int event_id, void* event_data, size_t event_data_size,
    TickType_t ticks_to_wait
);

/**
 * @brief  Default event handler for system events
 *
 * @note This API is part of the legacy event system. New code should use event library API in esp_event.h
 *
 * This function performs default handling of system events.
 * When using esp_event_loop APIs, it is called automatically before invoking the user-provided
 * callback function.
 *
 * Applications which implement a custom event loop must call this function
 * as part of event processing.
 *
 * @param  event   pointer to event to be handled
 * @return ESP_OK if an event was handled successfully
 */
deprecated
esp_err_t esp_event_process_default(system_event_t* event);

/**
  * @brief  Install default event handlers for Ethernet interface
  *
  * @note This API is part of the legacy event system. New code should use event library API in esp_event.h
  *
  */
void esp_event_set_default_eth_handlers();

/**
  * @brief  Install default event handlers for Wi-Fi interfaces (station and AP)
  *
  * @note This API is part of the legacy event system. New code should use event library API in esp_event.h
  */
deprecated
void esp_event_set_default_wifi_handlers();

/**
 * @brief  Initialize event loop
 *
 * @note This API is part of the legacy event system. New code should use event library API in esp_event.h
 *
 * Create the event handler and task
 *
 * @param  cb   application specified event callback, it can be modified by call esp_event_set_cb
 * @param  ctx  reserved for user
 *
 * @return
 *    - ESP_OK: succeed
 *    - others: fail
 */
deprecated
esp_err_t esp_event_loop_init(system_event_cb_t cb, void* ctx);

/**
 * @brief  Set application specified event callback function
 *
 * @note This API is part of the legacy event system. New code should use event library API in esp_event.h
 *
 * @attention 1. If cb is NULL, means application don't need to handle
 *               If cb is not NULL, it will be call when an event is received, after the default event callback is completed
 *
 * @param  cb   application callback function
 * @param  ctx  argument to be passed to callback
 *
 *
 * @return old callback
 */
deprecated
system_event_cb_t esp_event_loop_set_cb(system_event_cb_t cb, void* ctx);
