%{
#include<stdio.h>
#include<string.h>
    
struct symboltable
{
	char symbol[20];
	double sval;
};

struct symboltable sym[10];
int insert(char symbol[20]);
int count = 0;
int i = 0;

%}

%union
{ 
  char S[10];
  int val;
  
}

%token <val> NUM
%token <S> ID
%left '+''-'
%left '*''/'
%type <val> E
%nonassoc UMINUS

%%
slist :S
      |slist S
      ;
S :E '\n'          {printf("%d\n",$1);}
     |ID'='E'\n'      {i=insert($1);sym[i].sval=$3;} 
     ;       
E : E'+'E     {$$=$1+$3;}
  | E'-'E     {$$=$1-$3;} 
  | E'*'E     {$$=$1*$3;}
  | E'/'E     {$$=$1/$3;} 
  |'('E')'    {$$=$2;}
  |ID         {i=insert($1);$$=sym[i].sval;}
  |'-'E       %prec UMINUS  {$$=-$2;}
  |NUM        {$$=$1;} 
  ;
%%

main()
{
printf("\n Please enter your expression : ");
yyparse();
printf("\n****************Symbol Table***********************");
	for (i = 0 ; i < count ; i++) {
		printf("\n%s \n", sym[i].symbol);
	}
}
int insert(char symbol[20]) {
	int flag = 0;
	int i = 0;
	for (i = 0 ; i < count ; i++) {
		if (strcmp(sym[i].symbol, symbol) == 0) {
			flag = 1;
			return i;
		}
	}
	if (flag == 0) {
		//printf("\nInserted");
		strcpy(sym[count++].symbol, symbol);
		return count-1;
	}
}
/*
output:
student@comp4:~$ yacc -d yacc.y
student@comp4:~$ lex ee.l
student@comp4:~$ gcc lex.yy.c y.tab.c -o ee -ll
student@comp4:~$ ./ee

 Please enter your expression : 
a=16
c=4
d=a-c
d
12
$

****************Symbol Table***********************
a 

c

d 
student@comp4:~$ 

*/
