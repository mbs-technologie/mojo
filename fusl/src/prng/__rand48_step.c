#include <stdint.h>

uint64_t __rand48_step(unsigned short *xi, unsigned short *lc)
{
	uint64_t a, x;
	x = xi[0] | ((uint32_t)xi[1])<<16 | ((uint64_t)xi[2])<<32;
	a = lc[0] | ((uint32_t)lc[1])<<16 | ((uint64_t)lc[2])<<32;
	x = a*x + lc[3];
	xi[0] = x;
	xi[1] = x>>16;
	xi[2] = x>>32;
	return x & 0xffffffffffffull;
}
