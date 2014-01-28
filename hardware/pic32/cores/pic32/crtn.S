#if (__C32_VERSION__ < 200)
# define USE_OLD_DOTSECTION
#endif

#ifdef USE_OLD_DOTSECTION
# define CODE_SECTION(name) .section name, "ax", @progbits
#else
# define CODE_SECTION(name) .section name, code
#endif

	CODE_SECTION(.init)
	lw	$31,20($sp)
	addu	$sp,$sp,32
	j	$31

	CODE_SECTION(.fini)
	lw	$31,20($sp)
	addu	$sp,$sp,32
	j	$31

