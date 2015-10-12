%{
	#include<string.h>
	#include "y.tab.h"
%}

%%

[+*/()=-]		{ return yytext[0]; }
[a-zA-Z_][a-zA-Z_0-9]*	{ strcpy(yylval.str,yytext); return ID;}
[0-9]*			{ strcpy(yylval.str,yytext); return NUM;}
"$"			{ return 0; }
"\n"			{ return yytext[0]; }

%%
