%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int i=0,index1=0,tindex=0;
void addqruple(char op[5],char arg1[10],char arg2[10],char result[10]);
int yylex();
int yyerror();
struct q
{
      char op[5];
      char arg1[10];
      char arg2[10];
      char result[10];
}q[30];

%}

%union
{
  char var[10];
}

%token <var>NUM VAR 
%type <var>EXPR ASSIGNMENT 
%left'-''+'
%left'*''/'
%nonassoc UMINUS
%left '('')'

%%

ASSIGNMENT:VAR'='EXPR {
           	strcpy(q[index1].op,"=");
           	strcpy(q[index1].arg1,$3);
           	strcpy(q[index1].arg2,"");
           	strcpy(q[index1].result,$1);
           	strcpy($$,q[index1++].result);
            	}
            ;
EXPR:EXPR'+'EXPR {addqruple("+",$1,$3,$$);}
    |EXPR'-'EXPR {addqruple("-",$1,$3,$$);}
    |EXPR'*'EXPR {addqruple("*",$1,$3,$$);}
    |EXPR'/'EXPR {addqruple("/",$1,$3,$$);}
    |'('EXPR')'EXPR {strcpy($$,$2);}
    |'-'EXPR {addqruple("uminus",$2,"",$$);}
    |VAR
    |NUM
    ;

%%

int main()
{// at end of expression we have to give .
printf("Enter the expression : \n");
yyparse();
printf("\n\nthree address code");
for(i=0;i<index1;i++)
{
 printf("\n %s\t %c\t %s\t %s\t %s\n",q[i].result, '=', q[i].arg1,q[i].op,q[i].arg2);
}
printf("\n\nINDEX\t OP\t ARG1\t ARG2\t RESULT");
for(i=0;i<index1;i++)
{
 printf("\n%d\t %s\t %s\t %s\t %s\n",i,q[i].op,q[i].arg1,q[i].arg2,q[i].result);
}
return 0;
}
void addqruple(char op[5],char arg1[10],char arg2[10],char result[10])
 {
 strcpy(q[index1].op,op);
 strcpy(q[index1].arg1,arg1);
 strcpy(q[index1].arg2,arg2);
 sprintf(q[index1].result,"t%d",tindex++);
 strcpy(result,q[index1++].result);  
 }

int yyerror()
{ 
  return 1;
}
int yywrap()
{
return 1;
}
/*
Summary:
This code implements a simple parser for arithmetic expressions using yacc (Yet Another Compiler Compiler). 
It defines grammar rules for expressions involving addition, subtraction, multiplication, and division, as well as parentheses and unary minus.
The parser generates three-address code for each operation encountered in the input expression. The generated three-address code is stored in an array of structures.
At the end of parsing, the program prints both the three-address code and a tabular representation of the operations.
The addqruple function is responsible for adding entries to the three-address code array.
Overall, this code demonstrates how to parse arithmetic expressions and generate corresponding three-address code using yacc.

Summary: Three-address code is used in system software, particularly in compilers and interpreters, due to its simplicity,
effectiveness as an intermediate representation, optimization capabilities, portability, and ability to separate concerns during the compilation process.
It simplifies program operations, aids optimization, facilitates portability across different architectures, and divides the compilation process into manageable parts.


a=b*c+d;

lex fn.lex
gcc lex.yy.c y.tab.c
./a.out

input ==a=b*c+d;
*/

oral
//
What is intermediate code? Ans: During the translation of a source program into the object code for a target machine, 
a compiler may generate a middle-level language code, which is known as intermediate code or intermediate text.
 The complexity of this code lies between the source language code and the object code.