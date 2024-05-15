%{ 
#include<stdio.h>
#include "y.tab.h"
%}
%%
int|float|char {return datatype;}
[a-zA-Z_][a-zA-Z0-9_]* {return id;}
"," {return comma;}
";" {return SC;}
"\n" {return NL;}
%%




