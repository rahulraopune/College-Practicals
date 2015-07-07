%{
	#include<stdio.h>
	
%}

%%
"#include"[ \t]*"<"[a-z]+"."[hc]">"		{printf("%s\t Preprocessor directive\n",yytext);}

"int"|"void"|"float"|"char"|"double"|"return"	{printf("%s\t Keyword",yytext);}			

"main"						{printf("%s\t MAIN\n",yytext);}

"("						{printf("%s\t Opening brackets\n",yytext);}

")"						{printf("%s\t Closing brackets\n",yytext);}

"%d"|"%s"|"%c"|"%f"|"%e"|"%u"			{printf("%s \t Access specifier\n",yytext);}

\"[^"\n]*\"					{printf("%s\t String constant\n",yytext);}

[,;]						{printf("%s\t Delimiter\n",yytext);}	

"{"						{printf("%s\t Opening Paranthesis\n",yytext);}

"}"						{printf("%s\t Closing Paranthesis\n",yytext);}

['](.|\n)[']					{printf("%s\t Character constant\n",yytext);}

[_a-zA-Z][_a-zA-Z0-9]*				{printf("%s\t identifier \n",yytext);}

[0-9]+						{printf("%s\t CONST\n",yytext);}

[-*+/=%]					{printf("%s\t Arithematic operator",yytext);}

"//".*                                          {printf("%s\t Comment",yytext);}

                                   
%%


main()
{
yylex();


}
int yywrap()

{
      return 1;
      
}
