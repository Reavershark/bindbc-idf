module idf.esp_netif.esp_netif_ppp;

import idf.esp_common.esp_err : esp_err_t;
import idf.esp_event : esp_event_base_t;
import idf.esp_netif.esp_netif_types : esp_netif_t;

@safe nothrow @nogc extern (C):

/** @brief event id offset for PHASE related events
 *
 * All PPP related events are produced from esp-netif under `NETIF_PPP_STATUS`, this offset defines
 * helps distinguish between error and phase events
 */
enum NETIF_PP_PHASE_OFFSET = 0x100;

/** @brief event id offset for internal errors
 *
 */
enum NETIF_PPP_INTERNAL_ERR_OFFSET = 0x200;

// dfmt off
/** @brief Configuration structure for PPP network interface
 *
 */
struct esp_netif_ppp_config_t
{
    bool ppp_phase_event_enabled; /**< Enables events coming from PPP PHASE change */
    bool ppp_error_event_enabled; /**< Enables events from main PPP state machine producing errors */
}

/** @brief event ids for different PPP related events
 *
 */
enum esp_netif_ppp_status_event_t
{
    NETIF_PPP_ERRORNONE          = 0,  /* No error. */
    NETIF_PPP_ERRORPARAM         = 1,  /* Invalid parameter. */
    NETIF_PPP_ERROROPEN          = 2,  /* Unable to open PPP session. */
    NETIF_PPP_ERRORDEVICE        = 3,  /* Invalid I/O device for PPP. */
    NETIF_PPP_ERRORALLOC         = 4,  /* Unable to allocate resources. */
    NETIF_PPP_ERRORUSER          = 5,  /* User interrupt. */
    NETIF_PPP_ERRORCONNECT       = 6,  /* Connection lost. */
    NETIF_PPP_ERRORAUTHFAIL      = 7,  /* Failed authentication challenge. */
    NETIF_PPP_ERRORPROTOCOL      = 8,  /* Failed to meet protocol. */
    NETIF_PPP_ERRORPEERDEAD      = 9,  /* Connection timeout */
    NETIF_PPP_ERRORIDLETIMEOUT   = 10, /* Idle Timeout */
    NETIF_PPP_ERRORCONNECTTIME   = 11, /* Max connect time reached */
    NETIF_PPP_ERRORLOOPBACK      = 12, /* Loopback detected */
    NETIF_PPP_PHASE_DEAD         = NETIF_PP_PHASE_OFFSET + 0,
    NETIF_PPP_PHASE_MASTER       = NETIF_PP_PHASE_OFFSET + 1,
    NETIF_PPP_PHASE_HOLDOFF      = NETIF_PP_PHASE_OFFSET + 2,
    NETIF_PPP_PHASE_INITIALIZE   = NETIF_PP_PHASE_OFFSET + 3,
    NETIF_PPP_PHASE_SERIALCONN   = NETIF_PP_PHASE_OFFSET + 4,
    NETIF_PPP_PHASE_DORMANT      = NETIF_PP_PHASE_OFFSET + 5,
    NETIF_PPP_PHASE_ESTABLISH    = NETIF_PP_PHASE_OFFSET + 6,
    NETIF_PPP_PHASE_AUTHENTICATE = NETIF_PP_PHASE_OFFSET + 7,
    NETIF_PPP_PHASE_CALLBACK     = NETIF_PP_PHASE_OFFSET + 8,
    NETIF_PPP_PHASE_NETWORK      = NETIF_PP_PHASE_OFFSET + 9,
    NETIF_PPP_PHASE_RUNNING      = NETIF_PP_PHASE_OFFSET + 10,
    NETIF_PPP_PHASE_TERMINATE    = NETIF_PP_PHASE_OFFSET + 11,
    NETIF_PPP_PHASE_DISCONNECT   = NETIF_PP_PHASE_OFFSET + 12,
    NETIF_PPP_CONNECT_FAILED     = NETIF_PPP_INTERNAL_ERR_OFFSET + 0,
}

/** @brief definitions of different authorisation types
 *
 */
enum esp_netif_auth_type_t
{
    NETIF_PPP_AUTHTYPE_NONE      = 0x00,
    NETIF_PPP_AUTHTYPE_PAP       = 0x01,
    NETIF_PPP_AUTHTYPE_CHAP      = 0x02,
    NETIF_PPP_AUTHTYPE_MSCHAP    = 0x04,
    NETIF_PPP_AUTHTYPE_MSCHAP_V2 = 0x08,
    NETIF_PPP_AUTHTYPE_EAP       = 0x10,
}
// dfmt on

/** @brief Sets the auth parameters for the supplied esp-netif.
 *
 * @param[in]  esp_netif Handle to esp-netif instance
 * @param[in]  authtype Authorisation type
 * @param[in]  user User name
 * @param[in]  passwd Password
 *
 * @return     ESP_OK on success,
 *             ESP_ERR_ESP_NETIF_INVALID_PARAMS if the supplied netif is not of PPP type, or netif is null
 */
esp_err_t esp_netif_ppp_set_auth(esp_netif_t* netif, esp_netif_auth_type_t authtype,
    const char* user, const char* passwd);

/** @brief Sets common parameters for the supplied esp-netif.
 *
 * @param[in]  esp_netif Handle to esp-netif instance
 * @param[in]  config Pointer to PPP netif configuration structure
 *
 * @return     ESP_OK on success,
 *             ESP_ERR_ESP_NETIF_INVALID_PARAMS if the supplied netif is not of PPP type, or netif is null
 */
esp_err_t esp_netif_ppp_set_params(esp_netif_t* netif, const esp_netif_ppp_config_t* config);

/** @brief Gets parameters configured in the supplied esp-netif.
 *
 * @param[in]  esp_netif Handle to esp-netif instance
 * @param[out]  config Pointer to PPP netif configuration structure
 *
 * @return     ESP_OK on success,
 *             ESP_ERR_ESP_NETIF_INVALID_PARAMS if the supplied netif is not of PPP type, or netif is null
 */
esp_err_t esp_netif_ppp_get_params(esp_netif_t* netif, esp_netif_ppp_config_t* config);

/** @brief PPP event base */
extern __gshared esp_event_base_t NETIF_PPP_STATUS;
