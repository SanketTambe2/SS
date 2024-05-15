%{    
  #include<stdio.h>
  #include<string.h>
  void yyerrro(char *s);
  int yylex();
  void addSymbols(char*,char*);
  void addToTable(char*, char*);
  void printTable();
  struct symbolEntry { 
    char* type;
    char* symbol;
    struct symbolEntry * next;
  };

  typedef struct symbolEntry SymbolEntry; 

  SymbolEntry *table = NULL;
%}




%union{
  char* type;
  char* id;
}

%token COMMA SEMI_COLON
%token <type> TYPE
%token <id> ID
%token print
%start program
%type <id> identifier
%%

program : statement {;}
        | program statement {;}
        | program print { printTable(); }
        ;

statement : TYPE identifier SEMI_COLON { addSymbols($1,$2); }
          ;
identifier : ID { // update entry in symbol table 
                }
           | identifier COMMA identifier { $$ = strcat(strcat($1,","),$3); }
           ;
%%

void addSymbols(char* type,char* symbols){
  char*token;
  token = strtok(symbols,",");
  while(token != NULL){
    addToTable(type,token);
    token = strtok(NULL,",");
  }
}

void addToTable(char *type, char *id){
  SymbolEntry *entry = (SymbolEntry * )malloc(sizeof(SymbolEntry));
  entry->type = type;
  entry->symbol = id;
  entry->next = NULL;

  if( table == NULL){
    table = entry;
    return;
  }
  SymbolEntry *ptr = table;
  while(ptr->next != NULL){
    ptr = ptr->next;
  }
  ptr->next = entry;
}

void printTable(){
  SymbolEntry *ptr = table;
  printf("\nTYPE \tSYMBOL");
  while(ptr != NULL){
    printf("\n%s\t%s",ptr->type,ptr->symbol);
    ptr=ptr->next;
  }
}

int main(){
 printf("ENTER THE EXPRESSION : \n");
  yyparse();
  return 0;
}


void yyerror (char *s) {fprintf (stderr, "%s\n", s);}

/*
int 5
$
print


lex filename.lex
gcc lex.yy.c y.tab.c
./a.out

  input== int 5
$
print
*/

// 
1>> LEX (lexer genrator)
1> lex is a tool for genrating lexical analyzers also known as lexers or tokenizers.
-input of lex is set of regular EXPRESSION
-output of lex is lexical analyzers
-lex is a computer program that genrates lexical analyzers.
-lex is commonly used with the yacc parser genrator

2>> Yacc (parser genrate)
-Yacc is a tool of genrating parsers for content tree grammers.
-yacc takes a format grammer specification & associated action as input & generates c code for parser
-input of yacc is the rule or grammer
-output of yacc is c code for parser(c program)
-$ in yacc represents the value returned by the complete action.