// preprocessor.cpp : Defines the entry point for the console application.

#include <stdio.h>
#include <stdlib.h>

extern int yyparse();
extern int yylineno;
extern int yy_scan_string(const char* str);
extern FILE *yyin;
extern int error_flag;
extern int yydebug; 

int main(int argc, char* argv[])
{
	char *ret;
	yydebug=0; 

	printf("Running application...\n");

	if (argc>2)			// blogi argumentai
	{
		fprintf(stderr,"Wrong parameter list:\n");

		return 0;
	}
	else if (argc==2)		
	{
			FILE *input,*output;
			input=fopen(argv[1],"r");
			if (!input) 
			{
				fprintf(stderr,"Source file does not exist\n");
				return -1;
			}

			yyin=input;
			int ret=yyparse();

			if (ret) 
			{
				fprintf(stderr,"Cancelled\n");
				return -1;
			}	
	}
}