
/*
 *
 * CS-413 Spring 98
 * shell.l: lexical analyzer for shell
 * You have to extend it.
 *
 */

%{

#include <string.h>
#include "y.tab.h"

%}

%%

[\n] 	{
		return NEWLINE;
	}

"|" 	{
		return NEWCOMMAND;
	}

"&" 	{
		return BACK;
	}

[ \t] 	{
		/* Discard spaces and tabs */
     	}	

(">")+ 	{
		return GREAT;
	}

("<")+ 	{
		return LESS;
	}

[^ \t\n][^ \t\n]*  {
		/* Assume that file names have only alpha chars */
		yylval.string_val = strdup(yytext);
		return WORD;
	}

.	{
		/* Invalid character in input */
		return NOTOKEN;
	}

%%
	
