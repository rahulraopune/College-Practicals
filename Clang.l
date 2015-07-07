%{
	#include <stdio.h>
	#include <string.h>
	struct symbol
	{
		char sname[10];
		struct symbol *right;
		struct symbol *left;
	}STAB[20];
	int symcnt=0;

%}

%%
"#include"[ \t]*"<"[a-z]+"."[hc]">"	{printf("%s\t Preprocessor directives\n",yytext); }
"int"|"void"|"float"|"enum"|"return"	{printf("%s\t Keywords\n",yytext); }
"\"%d\""|"\"%s\""|"\"%c\""|"\"%f\""	{printf("%s\t Access Specifiers\n",yytext); }		
"main"					{printf("%s\t MAIN\n",yytext);insert(yytext);}
"("					{printf("%s\t Opening Paranthesis\n",yytext); }
")"					{printf("%s\t Closing Paranthesis\n",yytext); }
"{"					{printf("%s\t Opening Braces\n",yytext); }
"}"					{printf("%s\t Closing Braces\n",yytext); }
[ \t\n]+				{printf("%s\t newline or tab");}
[,;]					{printf("%s\t Delimeters\n",yytext);}
[_a-zA-z][_a-zA-Z0-9]*			{printf("%s\t Variables\n",yytext); insert(yytext); }
[0-9][0-9]*				{printf("%s\t Numeric constant\n",yytext); }
\"[^"\n]*\"				{printf("%s\t String constant\n",yytext); }
['].|\n[']				{printf("%s\t Character constants\n",yytext);}
[-+*=/%]				{printf("%s\t Operators\n",yytext);}
[<>=]					{printf("%s\t Relational operator\n",yytext); }
%%


int insert(char yytext[])
{
	int i=0,flag=0;
	for(i=0;i<symcnt;i++)
	{

		if(strcmp(STAB[i].sname,yytext) == 0)
		{
			flag=1;
			break;
		}
	}
	if(flag!=1)
	{
		strcpy(STAB[symcnt++].sname,yytext);
				
	}


}


void table()
{
	int i=0;
	for(i=0;i<symcnt;i++)
	{
		printf("%s\n",STAB[i].sname);
	}
}

main()
{
	FILE *ptr;
	ptr=fopen("sample.c","r");
	yyin=ptr;
	yylex();
	printf("------------------------------------------------------------");
	printf("\nSymbol Table\n");
	printf("------------------------------------------------------------\n");
	table();
	
}
int yywrap()
{
	return 1;
}
