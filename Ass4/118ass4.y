%{
	#include<stdio.h>
%}

%token Connectives Word Fullstop

%%
start:Words Fullstop {printf("\nSimple Sentence");} | Words Connectives Words Fullstop {printf("\nCompound Sentence");}
	|Words: Word Words| Word;	 
%%

int main()
{
        printf("ENTER THE STATEMENT : ");
	yyparse();
	return 0;
}
int yywrap()
{
	return 1;
}
int yyerror()
{
	return 0;
}

