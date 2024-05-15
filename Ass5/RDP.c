#include <stdio.h>  
#include <string.h>  
  
#define SUCCESS 1  
#define FAILED 0  
  
int E(), Edash(), T(), Tdash(), F();  
  
const char *cursor;  
char string[64];  
  
int main()  
{  
   // puts("Enter the string");  
    // scanf("%s", string);  
   sscanf("i+(i+i)*i", "%s", string);  
    cursor = string;  
    puts("");  
    puts("Input      Action");  
    puts("--------------------------------");  
  
    if (E() && *cursor == '\0') {  
        puts("--------------------------------");  
        puts("String is successfully parsed");  
        return 0;  
    } else {  
        puts("--------------------------------");  
        puts("Error in parsing String");  
        return 1;  
    }  
}  
  
int E()  
{  
    printf("%-16s E -> T E'\n", cursor);  
    if (T()) {  
        if (Edash())  
            return SUCCESS;  
        else  
            return FAILED;  
    } else  
        return FAILED;  
}  
  
int Edash()  
{  
    if (*cursor == '+') {  
        printf("%-16s E' -> + T E'\n", cursor);  
        cursor++;  
        if (T()) {  
            if (Edash())  
                return SUCCESS;  
            else  
                return FAILED;  
        } else  
            return FAILED;  
    } else {  
        printf("%-16s E' -> $\n", cursor);  
        return SUCCESS;  
    }  
}  
  
int T()  
{  
    printf("%-16s T -> F T'\n", cursor);  
    if (F()) {  
        if (Tdash())  
            return SUCCESS;  
        else  
            return FAILED;  
    } else  
        return FAILED;  
}  
  
int Tdash()  
{  
    if (*cursor == '*') {  
        printf("%-16s T' -> * F T'\n", cursor);  
        cursor++;  
        if (F()) {  
            if (Tdash())  
                return SUCCESS;  
            else  
                return FAILED;  
        } else  
            return FAILED;  
    } else {  
        printf("%-16s T' -> $\n", cursor);  
        return SUCCESS;  
    }  
}  
  
int F()  
{  
    if (*cursor == '(') {  
        printf("%-16s F -> ( E )\n", cursor);  
        cursor++;  
        if (E()) {  
            if (*cursor == ')') {  
                cursor++;  
                return SUCCESS;  
            } else  
                return FAILED;  
        } else  
            return FAILED;  
    } else if (*cursor == 'i') {  
        cursor++;  
        printf("%-16s F ->i\n", cursor);  
        return SUCCESS;  
    } else  
        return FAILED;  
}  


/*It is a kind of Top-Down Parser. A top-down parser builds the parse tree from the top to down, starting with the start non-terminal. A Predictive Parser is a special case of Recursive Descent Parser, where no Back Tracking is required. 

/*#define SUCCESS 1: Defines a macro SUCCESS with a value of 1.
#define FAILED 0: Defines a macro FAILED with a value of 0.
int E(), Edash(), T(), Tdash(), F();: Prototypes of the parsing functions. Each function corresponds to a non-terminal symbol in the grammar.
const char *cursor;: Declares a pointer cursor to track the current position while parsing the input string.
char string[64];: Declares an array string to store the input string.

Parsing Functions
E(), Edash(), T(), Tdash(), F(): These functions implement the parsing rules for the non-terminal symbols E, E', T, T', and F, respectively.
Each function tries to match a specific pattern in the input string according to the grammar rules.
They print the corresponding production rule that is being applied.
They return SUCCESS if the parsing is successful according to the grammar rules, and FAILED otherwise.

The grammar for arithmetic expressions is parsed recursively, with each function corresponding to a non-terminal symbol in the grammar.
The parsing starts from the top-level expression E().
The parsing functions recursively call each other to parse nested expressions and operands according to the grammar rules.
The parsing functions print the production rules being applied to demonstrate the parsing process.
If the entire input string is successfully parsed, and the cursor reaches the end of the string, it prints a success message; otherwise, it prints an error message.
*/




