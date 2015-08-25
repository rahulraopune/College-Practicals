%{
#include"y.tab.h"

%}

%%
[=+*/()-]                 {return yytext[0];}
[a-zA-z_][a-zA-Z_0-9]*   {strcpy(yylval.S,yytext);return ID;}
[\n]                   {return yytext[0];}
[0-9]+                   {yylval.val=atoi(yytext); return NUM;}
"$"                        {return 0;}
%%

int yyerror(char *s)
{
 printf("%s",s);
}
int yywrap()
{
 return 1;
}



