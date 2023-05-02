#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
int main(int argc , char* argv[]) {

	FILE* file;
	file = fopen(argv[1],"w");
	openlog("slog", LOG_DEBUG|LOG_ERR, LOG_USER);
	if (argc < 3) {
		syslog(LOG_ERR, "both aruments are required");
		exit(1);
	}

	if (file == NULL) {
		syslog(LOG_ERR, "Couldn't open file %s ",argv[1]);
		exit(1);
	} else {		
		fprintf(file,"%s", argv[2]);
		syslog(LOG_DEBUG, "Writing %s to %s",argv[2],argv[1]);
		closelog();
		fclose(file);
	}
}

