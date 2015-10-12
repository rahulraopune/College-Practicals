%{
	#include<stdio.h>
	#include "y.tab.h"
%}

%%

[+*/()=-]		{ return yytext[0]; }
[a-zA-Z_][a-zA-Z_0-9]*	{ strcpy(yylval.str,yytext); return ID; }
"\n"			{ return yytext[0]; };
"$"			{ return 0; }

%%

int yywrap(){

	return 1;
}
