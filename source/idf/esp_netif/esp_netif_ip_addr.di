module idf.esp_netif.esp_netif_ip_addr;

// TODO: Implement most macros

@safe nothrow @nogc extern (C):

version (BigEndian)
{
    // #define esp_netif_htonl(x) ((uint32_t)(x))
}
else
{
    // #define esp_netif_htonl(x) ((((x) & (uint32_t)0x000000ffUL) << 24) | \
    //                       (((x) & (uint32_t)0x0000ff00UL) <<  8) | \
    //                       (((x) & (uint32_t)0x00ff0000UL) >>  8) | \
    //                       (((x) & (uint32_t)0xff000000UL) >> 24))
}

// #define esp_netif_ip4_makeu32(a,b,c,d) (((uint32_t)((a) & 0xff) << 24) | \
//                                ((uint32_t)((b) & 0xff) << 16) | \
//                                ((uint32_t)((c) & 0xff) << 8)  | \
//                                 (uint32_t)((d) & 0xff))

// Access address in 16-bit block
// #define ESP_IP6_ADDR_BLOCK1(ip6addr) ((uint16_t)((esp_netif_htonl((ip6addr)->addr[0]) >> 16) & 0xffff))
// #define ESP_IP6_ADDR_BLOCK2(ip6addr) ((uint16_t)((esp_netif_htonl((ip6addr)->addr[0])) & 0xffff))
// #define ESP_IP6_ADDR_BLOCK3(ip6addr) ((uint16_t)((esp_netif_htonl((ip6addr)->addr[1]) >> 16) & 0xffff))
// #define ESP_IP6_ADDR_BLOCK4(ip6addr) ((uint16_t)((esp_netif_htonl((ip6addr)->addr[1])) & 0xffff))
// #define ESP_IP6_ADDR_BLOCK5(ip6addr) ((uint16_t)((esp_netif_htonl((ip6addr)->addr[2]) >> 16) & 0xffff))
// #define ESP_IP6_ADDR_BLOCK6(ip6addr) ((uint16_t)((esp_netif_htonl((ip6addr)->addr[2])) & 0xffff))
// #define ESP_IP6_ADDR_BLOCK7(ip6addr) ((uint16_t)((esp_netif_htonl((ip6addr)->addr[3]) >> 16) & 0xffff))
// #define ESP_IP6_ADDR_BLOCK8(ip6addr) ((uint16_t)((esp_netif_htonl((ip6addr)->addr[3])) & 0xffff))

enum IPSTR = "%d.%d.%d.%d";
// #define esp_ip4_addr_get_byte(ipaddr, idx) (((const uint8_t*)(&(ipaddr)->addr))[idx])
// #define esp_ip4_addr1(ipaddr) esp_ip4_addr_get_byte(ipaddr, 0)
// #define esp_ip4_addr2(ipaddr) esp_ip4_addr_get_byte(ipaddr, 1)
// #define esp_ip4_addr3(ipaddr) esp_ip4_addr_get_byte(ipaddr, 2)
// #define esp_ip4_addr4(ipaddr) esp_ip4_addr_get_byte(ipaddr, 3)

// #define esp_ip4_addr1_16(ipaddr) ((uint16_t)esp_ip4_addr1(ipaddr))
// #define esp_ip4_addr2_16(ipaddr) ((uint16_t)esp_ip4_addr2(ipaddr))
// #define esp_ip4_addr3_16(ipaddr) ((uint16_t)esp_ip4_addr3(ipaddr))
// #define esp_ip4_addr4_16(ipaddr) ((uint16_t)esp_ip4_addr4(ipaddr))

// #define IP2STR(ipaddr) esp_ip4_addr1_16(ipaddr), \
//     esp_ip4_addr2_16(ipaddr), \
//     esp_ip4_addr3_16(ipaddr), \
//     esp_ip4_addr4_16(ipaddr)

enum IPV6STR = "%04x:%04x:%04x:%04x:%04x:%04x:%04x:%04x";

// #define IPV62STR(ipaddr) ESP_IP6_ADDR_BLOCK1(&(ipaddr)),     \
//     ESP_IP6_ADDR_BLOCK2(&(ipaddr)),     \
//     ESP_IP6_ADDR_BLOCK3(&(ipaddr)),     \
//     ESP_IP6_ADDR_BLOCK4(&(ipaddr)),     \
//     ESP_IP6_ADDR_BLOCK5(&(ipaddr)),     \
//     ESP_IP6_ADDR_BLOCK6(&(ipaddr)),     \
//     ESP_IP6_ADDR_BLOCK7(&(ipaddr)),     \
//     ESP_IP6_ADDR_BLOCK8(&(ipaddr))

enum ESP_IPADDR_TYPE_V4 = 0u;
enum ESP_IPADDR_TYPE_V6 = 6u;
enum ESP_IPADDR_TYPE_ANY = 46u;

// #define ESP_IP4TOUINT32(a,b,c,d) (((uint32_t)((a) & 0xffU) << 24) | \
//                                ((uint32_t)((b) & 0xffU) << 16) | \
//                                ((uint32_t)((c) & 0xffU) << 8)  | \
//                                 (uint32_t)((d) & 0xffU))

// #define ESP_IP4TOADDR(a,b,c,d) esp_netif_htonl(ESP_IP4TOUINT32(a, b, c, d))

// #define ESP_IP4ADDR_INIT(a, b, c, d)  { .type = ESP_IPADDR_TYPE_V4, .u_addr = { .ip4 = { .addr = ESP_IP4TOADDR(a, b, c, d) }}};
// #define ESP_IP6ADDR_INIT(a, b, c, d)  { .type = ESP_IPADDR_TYPE_V6, .u_addr = { .ip6 = { .addr = { a, b, c, d }, .zone = 0 }}};

/**
 * @brief IPv6 address
 *
 */
struct esp_ip6_addr_t
{
    uint[4] addr; /*!< IPv6 address */
    ubyte zone; /*!< zone ID */
}

/**
 * @brief IPv4 address
 *
 */
struct esp_ip4_addr_t
{
    uint addr; /*!< IPv4 address */
}

/**
 * @brief IP address
 *
 */
struct esp_ip_addr_t
{
    union Addr
    {
        esp_ip6_addr_t ip6; /*!< IPv6 address type */
        esp_ip4_addr_t ip4; /*!< IPv4 address type */
    }

    Addr u_addr; /*!< IP address union */
    ubyte type; /*!< ipaddress type */
}

enum esp_ip6_addr_type_t
{
    ESP_IP6_ADDR_IS_UNKNOWN,
    ESP_IP6_ADDR_IS_GLOBAL,
    ESP_IP6_ADDR_IS_LINK_LOCAL,
    ESP_IP6_ADDR_IS_SITE_LOCAL,
    ESP_IP6_ADDR_IS_UNIQUE_LOCAL,
    ESP_IP6_ADDR_IS_IPV4_MAPPED_IPV6,
}

/**
 * @brief  Get the IPv6 address type
 *
 * @param[in]  ip6_addr IPv6 type
 *
 * @return IPv6 type in form of enum esp_ip6_addr_type_t
 */
esp_ip6_addr_type_t esp_netif_ip6_get_addr_type(esp_ip6_addr_t* ip6_addr);

/**
 * @brief  Copy IP addresses
 *
 * @param[out] dest destination IP
 * @param[in]  src source IP
 */
// static inline void esp_netif_ip_addr_copy(esp_ip_addr_t *dest, const esp_ip_addr_t *src)
// {
//     dest->type = src->type;
//     if (src->type == ESP_IPADDR_TYPE_V6) {
//         dest->u_addr.ip6.addr[0] = src->u_addr.ip6.addr[0];
//         dest->u_addr.ip6.addr[1] = src->u_addr.ip6.addr[1];
//         dest->u_addr.ip6.addr[2] = src->u_addr.ip6.addr[2];
//         dest->u_addr.ip6.addr[3] = src->u_addr.ip6.addr[3];
//         dest->u_addr.ip6.zone = src->u_addr.ip6.zone;
//     } else {
//         dest->u_addr.ip4.addr = src->u_addr.ip4.addr;
//         dest->u_addr.ip6.addr[1] = 0;
//         dest->u_addr.ip6.addr[2] = 0;
//         dest->u_addr.ip6.addr[3] = 0;
//         dest->u_addr.ip6.zone = 0;
//     }
// }
