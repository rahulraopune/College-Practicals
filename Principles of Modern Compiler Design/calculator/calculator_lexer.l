%{
	#include<string.h>
	#include<math.h>
	#include "y.tab.h"
%}

%%


[0-9]+			{ yylval = atoi(yytext); return NUM;}
[+]			{ return '+'; }
[-]			{ return '-'; }
[*]			{ return '*'; }
[/]			{ return '/'; }
"\n"			{ return 0; }
.			{ return yytext[0]; }

%%
