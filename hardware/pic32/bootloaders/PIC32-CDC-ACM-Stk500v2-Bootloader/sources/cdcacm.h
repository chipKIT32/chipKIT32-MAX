// *** cdcacm.h ****************************************************************

extern bool cdcacm_active;

typedef void (*cdcacm_reset_cbfn)(void);

void
cdcacm_print(const byte *line, int length);

void
cdcacm_command_ack(void);

void
cdcacm_register(cdcacm_reset_cbfn reset);  // XXX -- register receive upcall!

