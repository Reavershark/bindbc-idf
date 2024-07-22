module idf.sys.socket;

public import idf.sys.socket.idf_sys_socket_c_code;

@safe nothrow @nogc extern (C):

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
