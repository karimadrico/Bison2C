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
%token INICIO FIN LEE MUESTRA EJECUTA FIN_EJECUTA VECES USANDO HASTA_QUE ENTONCES MUEVE A MAYOR MENOR ENTRE SINO SI FIN_SI NO DANDO CALCULA SUMA RESTA MULTIPLICA DIVIDE FIN_CALCULA
%%
programa:
    PROGRAMA INICIO bloque FIN
    ;

bloque:
    /* Aquí irán las reglas para el bloque principal */
    /* vacío por ahora */
    ;
%%
int main() {
    yyparse();
    return 0;
}
