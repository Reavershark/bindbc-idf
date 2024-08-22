module idf.soc.i2s_reg;

public import idf.soc.i2s_reg.idf_soc_i2s_reg_c_code;

@safe nothrow @nogc:

import idf.soc.soc : DR_REG_I2S_BASE;

enum uint REG_I2S_BASE(uint i) = DR_REG_I2S_BASE + i * 0x1E000;

enum uint I2S_INT_RAW_REG(uint i) = REG_I2S_BASE!i + 0x000c;
enum uint I2S_INT_CLR_REG(uint i) = REG_I2S_BASE!i + 0x0018;
enum uint I2S_OUT_EOF_DES_ADDR_REG(uint i) = REG_I2S_BASE!i + 0x0038;
