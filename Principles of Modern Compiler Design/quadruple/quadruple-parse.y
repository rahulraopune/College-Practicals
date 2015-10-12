%{
	#include<stdio.h>
	#include<string.h>
	#include<stdlib.h>

	struct quadruple{

		char op[5];
		char arg1[5];
		char arg2[5];
		char result[5];
	};

	int quadruple_index = 0;
	int temp_index = 1;

	struct quadruple quadruple[20];
	void add_quadruple(char *op, char *arg1, char *arg2, char *result);
	void print_quadruple();
%}

%union{

	char str[5];
}

%token <str> NUM ID
%type <str> E
%left '+' '-'
%left '*' '/'

%%

S:E'='E		{
			strcpy(quadruple[quadruple_index].op,"=");
			strcpy(quadruple[quadruple_index].arg1,$3);
			strcpy(quadruple[quadruple_index].result,$1);

			quadruple_index++;
		}
 ;

E:E'+'E		{ add_quadruple("+",$1,$3,$$);}
 |E'-'E		{ add_quadruple("-",$1,$3,$$);}
 |E'*'E		{ add_quadruple("*",$1,$3,$$);}
 |E'/'E		{ add_quadruple("/",$1,$3,$$);}
 |ID		{ strcpy($$,$1); }
 |NUM		{ strcpy($$,$1); }
 ;

%%

void add_quadruple(char *op, char *arg1, char *arg2, char *result){

	strcpy(quadruple[quadruple_index].op,op);
	strcpy(quadruple[quadruple_index].arg1,arg1);
	strcpy(quadruple[quadruple_index].arg2,arg2);
	sprintf(quadruple[quadruple_index].result,"t%d",temp_index);

	strcpy(result,quadruple[quadruple_index].result);

	temp_index++;
	quadruple_index++;

}

void print_quadruple(){

	int i = 0;
	printf("op\targ1\targ2\tresult\n");
	for(i = 0; i<quadruple_index; i++){

		printf("%s\t",quadruple[i].op);
		printf("%s\t",quadruple[i].arg1);
		printf("%s\t",quadruple[i].arg2);
		printf("%s\t",quadruple[i].result);
		printf("\n");
	}
}

int main(){

	yyparse();
	print_quadruple();
	return 0;
}

int yyerror(){

	return 1;
}
