/* parser.y - Analizador sintáctico - Práctica de Bison de 2ª convocatoria
     Karima Drafli Rico */
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(const char *s) { fprintf(stderr, "Error: %s\n", s); }
int yylex(void);
%}

%union {
        char *str;
        int num;
}


%type <num> expresion
%type <str> operacion
%start programa

%token PROGRAMA
%token INICIO FIN LEE MUESTRA EJECUTA FIN_EJECUTA VECES USANDO HASTA_QUE ENTONCES MUEVE A MAYOR MENOR ENTRE SINO SI FIN_SI NO DANDO CALCULA SUMA RESTA MULTIPLICA DIVIDE FIN_CALCULA
%token <str> CADENA_DOBLE CADENA_SIMPLE IDENTIFICADOR
%token <num> NUMERO
%%
programa:
    PROGRAMA INICIO bloque FIN { printf("Compilación finalizada correctamente.\n"); }
    ;

bloque:
    sentencias
    ;

sentencias:
    /* vacío */
    | sentencias sentencia
    ;

sentencia:
            LEE IDENTIFICADOR { printf("READ %s\n", $2); }
        | MUESTRA expresion { printf("PRINT %d\n", $2); }
        | EJECUTA sentencias FIN_EJECUTA { printf("WHILE ... ENDWHILE\n"); }
        | SI expresion ENTONCES sentencias FIN_SI {
                    static int label = 0;
                    int this_label = label++;
                    printf("IFZ t%d GOTO L%d\n", $2, this_label);
                    // ... aquí iría el código de las sentencias ...
                    printf("L%d:\n", this_label);
            }
        | SI expresion ENTONCES sentencias SINO sentencias FIN_SI {
                    static int label = 0;
                    int else_label = label++;
                    int end_label = label++;
                    printf("IFZ t%d GOTO L%d\n", $2, else_label);
                    // ... sentencias del SI ...
                    printf("GOTO L%d\n", end_label);
                    printf("L%d:\n", else_label);
                    // ... sentencias del SINO ...
                    printf("L%d:\n", end_label);
            }
        | CALCULA operacion FIN_CALCULA { printf("Cálculo\n"); }
        ;

expresion:
      NUMERO { $$ = $1; }
    | IDENTIFICADOR { /* ... */ }
    | CADENA_DOBLE
    | CADENA_SIMPLE
    | expresion MAYOR expresion
    | expresion MENOR expresion
    | expresion ENTRE expresion
    | NO expresion
    ;

operacion:
      SUMA expresion DANDO IDENTIFICADOR
    | RESTA expresion DANDO IDENTIFICADOR
    | MULTIPLICA expresion DANDO IDENTIFICADOR
    | DIVIDE expresion DANDO IDENTIFICADOR
    ;
%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *f = fopen(argv[1], "r");
        if (!f) {
            perror("No se pudo abrir el archivo");
            return 1;
        }
        extern FILE *yyin;
        yyin = f;
    }
    yyparse();
    return 0;
}
