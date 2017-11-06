#include <stdio.h>
#include <stdlib.h>
#include <signal.h>

#include <unistd.h>


#include "log.h"
#include "list.h"

int main(int argc, char *argv[]) {
	log_set_options(LOG_OPT_CONSOLE_OUT | LOG_OPT_TIMESTAMPS);
	
	log_info("hello world!");

	log_err("hlll");
	return 0;
}
