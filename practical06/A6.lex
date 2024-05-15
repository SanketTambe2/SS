%{
#include "y.tab.h"
#include<stdio.h>
#include<math.h>
//extern int yylval;
//atof(yytext): This function converts the string yytext to a floating-point number. yytext typically represents the current token being processed by the lexer.
//yylval.dval: yylval is a special variable used in Lex/Flex to store the semantic value associated with the current token. dval suggests that it's storing a double value.
%}
%%
[0-9]+(\.[0-9]*)? 	{yylval.dval=atof(yytext); return NUMBER;}
[ \t]	;
\n	return 0;
.	return yytext[0];
%%
//In Lex/Flex, the yywrap() function is used to control what happens when the end of the input stream is reached. Here's how it works:
int yywrap()
{
return 1;
}
