%{
	#include<stdio.h>
	#include<stdlib.h>
	
	struct SymbolTable{
	
		char identifierName[10];
	};
	
	struct SymbolTable stable[20];
	int rowCounter = 0;
	
	//void insertToTable(char identifier[]);
	//void printTable();
%}

%%

"short"|"int"|"long"|"char"|"double"|"float"|"bool"	{ printf("\nData Type : %s",yytext); }
"main"							{ printf("\nMain Function : %s",yytext); }
"("							{ printf("\nOpen Param : %s",yytext); }
")"							{ printf("\nClose Param : %s",yytext); }
"{"							{ printf("\nOpen Function : %s",yytext); }
"}"							{ printf("\nClose Function : %s",yytext); }
";"							{ printf("\nEnd : %s",yytext); }
['].|\n[']						{ printf("\nCharacter constants : %s",yytext);}
[-+*=/%]						{ printf("\nOperators : %s",yytext);}
\"[^"\n]*\"						{ printf("\nString constant : %s",yytext);}
"printf"						{ printf("\nPrint Function : %s",yytext); }
"return"[ 0-9]*						{ printf("\nReturn : %s",yytext); }
"#include"[\t]*"<"[\t]*[a-z]+[.][hc][\t]*">"		{ printf("\nPreprocessor : %s",yytext); }
[a-zA-Z_][a-zA-Z0-9_]* 					{ printf("\nIdentifiers : %s",yytext); insertToTable(yytext); }	

%%

void insertToTable(char yytext[]){
	
	int duplicateFlag = 0;
	int i;
	
	for(i=0; i<rowCounter; i++){
		
		if( strcmp(stable[i].identifierName,yytext) == 0 ){

			duplicateFlag = 1;
			break;
		}
	}
	
	if( duplicateFlag != 1 ){

		strcpy(stable[rowCounter++].identifierName,yytext);		
	}
}

void printTable(){

	printf("\n Symbol Table \n");
	int i = 0;
	for(i=0; i<rowCounter; i++){
		
		printf("\n %c \t id",stable[i]);
	}
	
	printf("\n\n");
}

main(){

	FILE *filePointer;
	filePointer = fopen("SampleProgram.c","r");
	yyin = filePointer;
	yylex();
	printTable();
}

int yywrap() { 

	return 1; 
}



