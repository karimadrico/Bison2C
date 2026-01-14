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
      LEE IDENTIFICADOR { printf("Leer variable: %s\n", $2); }
    | MUESTRA expresion { printf("Mostrar expresión\n"); }
    | EJECUTA sentencias FIN_EJECUTA { printf("Bucle ejecuta\n"); }
    | SI expresion ENTONCES sentencias FIN_SI { printf("Condicional SI\n"); }
    | SI expresion ENTONCES sentencias SINO sentencias FIN_SI { printf("Condicional SI/SINO\n"); }
    | CALCULA operacion FIN_CALCULA { printf("Cálculo\n"); }
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
