/* parser.y - Analizador sintáctico - Práctica de Bison de 2ª convocatoria
   Karima Drafli Rico */
%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s) { fprintf(stderr, "Error: %s\n", s); }
int yylex(void);
%}

%start programa

%token PROGRAMA
%%
programa:
    PROGRAMA
    ;
%%
int main() {
    yyparse();
    return 0;
}
