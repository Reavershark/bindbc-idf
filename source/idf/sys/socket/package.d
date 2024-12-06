module idf.sys.socket;

@safe nothrow @nogc extern (C):

enum int AF_INET = 2;
enum uint IPADDR_ANY = 0;
enum uint IPPROTO_IP = 0;
enum int MSG_DONTWAIT = 0x08;
enum int SOCK_STREAM = 1;

alias sa_family_t = ubyte;

struct sockaddr
{
    ubyte sa_len;
    sa_family_t sa_family;
    char[14] sa_data;
}

alias in_port_t = ushort;
alias in_addr_t = uint;

struct in_addr
{
    in_addr_t s_addr;
}

enum size_t SIN_ZERO_LEN = 8;

struct sockaddr_in
{
    ubyte sin_len;
    sa_family_t sin_family;
    in_port_t sin_port;
    in_addr sin_addr;
    char[SIN_ZERO_LEN] sin_zero;
}

alias socklen_t = uint;

int lwip_accept(int socket, sockaddr* addr, socklen_t* addrlen);
int lwip_bind(int socket, const sockaddr* name, socklen_t namelen);
int lwip_close(int socket);
int lwip_connect(int socket, const sockaddr* name, socklen_t namelen);
int lwip_listen(int socket, int backlog);
ptrdiff_t lwip_recv(int socket, void* mem, size_t len, int flags);
ptrdiff_t lwip_send(int socket, const void* dataptr, size_t size, int flags);
int lwip_shutdown(int socket, int how);
int lwip_socket(int domain, int type, int protocol);

alias accept = lwip_accept;
alias bind = lwip_bind;
alias close = lwip_close;
alias connect = lwip_connect;
alias listen = lwip_listen;
alias recv = lwip_recv;
alias send = lwip_send;
alias shutdown = lwip_shutdown;
alias socket = lwip_socket;

// Implement hton family of macros as D functions
pure extern (D)
{
    version (BigEndian)
    {
        ushort htons(ushort x) => x;
        uint htonl(uint x) => x;
    }
    else
    {
        import core.bitop : bswap, byteswap;

        ushort htons(ushort x) => byteswap(x);
        uint htonl(uint x) => bswap(x);
    }
    alias ntohs = htons;
    alias ntohl = htonl;
}
