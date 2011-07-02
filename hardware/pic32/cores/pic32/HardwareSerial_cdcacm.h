//************************************************************************
// *** cdcacm.h
//************************************************************************

#include	"wiring.h"

extern boolean cdcacm_active;

typedef void (*cdcacm_reset_cbfn)(void);
typedef boolean (*cdcacm_storedata_cbfn)(const byte *buffer, int length);

#ifdef __cplusplus
	extern "C"{
#endif

	void	cdcacm_print(const unsigned char *line, int length);
	void	cdcacm_command_ack(void);
	void	cdcacm_register(cdcacm_reset_cbfn reset, cdcacm_storedata_cbfn storeData);  // revisit -- register receive upcall!

#ifdef __cplusplus
} // extern "C"
#endif
