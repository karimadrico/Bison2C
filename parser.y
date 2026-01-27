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
}

%start program

%token PROGRAM TBEGIN END
%token MOVE ADD SUBTRACT MULTIPLY DIVIDE
%token ACCEPT DISPLAY
%token IF THEN ELSE
%token WHILE DO
%token VARYING FROM TO BY
%token IS GREATER LESS EQUAL NOT THAN GIVING
%token DOT COMMA SEMICOLON LPAREN RPAREN
%token PLUS MINUS STAR SLASH

%token <str> ID
%token <str> NUM
%token <str> CAD


%%
/* Gramática mínima para compilar y empezar a validar estructura del lenguaje. */

program
    : PROGRAM ID DOT TBEGIN stmts END DOT
    ;

stmts
    : /* vacío */
    | stmts stmt
    ;

stmt
    : io SEMICOLON
    | assig SEMICOLON
    ;

io
    : DISPLAY literal
    | DISPLAY literal COMMA literal
    | ACCEPT ID
    ;

literal
    : ID
    | NUM
    | CAD
    ;

/* Expresiones aritméticas con la precedencia correcta (+,-) sobre (*,/). */

expr
    : mult
    | expr PLUS mult
    | expr MINUS mult
    ;

mult
    : val
    | mult STAR val
    | mult SLASH val
    ;

val
    : NUM
    | ID
    | LPAREN expr RPAREN
    ;

/* Asignaciones aritméticas: MOVE, ADD, SUBTRACT, MULTIPLY, DIVIDE. */

assig
    : MOVE expr TO ID
    | ADD expr TO ID
    | SUBTRACT expr FROM ID
    | MULTIPLY expr BY expr GIVING ID
    | DIVIDE expr BY expr GIVING ID
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
