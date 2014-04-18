#if (__C32_VERSION__ < 200)
# define USE_OLD_DOTSECTION
#endif

#ifdef USE_OLD_DOTSECTION
# define CODE_SECTION(name) .section name, "ax", @progbits
#else
# define CODE_SECTION(name) .section name, code
#endif

/* 4 slots for argument spill area.  1 for cpreturn, 1 for stack.
   Return spill offset of 40 and 20.  Aligned to 16 bytes for n32.  */

	CODE_SECTION(.init)
	.globl	_init
	.type	_init,@function
_init:
	addu	$sp,$sp,-32
	sw	$31,20($sp)
	
	CODE_SECTION(.fini)
	.globl	_fini
	.type	_fini,@function
_fini:
	addu	$sp,$sp,-32
	sw	$31,20($sp)
