%{
	#include<stdio.h>
%}

%token NUM
%left '+' '-'
%left '*' '/'

%%

S:E		{ printf("Result: %d\n",$$); }
 ;

E:E'+'E		{ $$ = $1 + $3; }
 |E'-'E		{ $$ = $1 - $3; }
 |E'*'E		{ $$ = $1 * $3; }
 |E'/'E		{ if($3==0){yyerror("Error"); } else{ $$ = $1 / $3;} }
 |'('E')'	{ $$ = $2; }
 |NUM		{ $$ = $1; }
 ;

%%


int main(){

	printf("Enter Expression : \n");

	if(yyparse()==0){

		printf("Success !");
	}else{

		printf("Failed");
	}

}

yywrap(){

	return 0;
}

yyerror(){

	return 1;
}
