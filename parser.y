/* parser.y - Analizador sintáctico - Práctica de Bison de 2ª convocatoria
     Karima Drafli Rico */
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int temp_count = 1;

static char *new_temp(void) {
    char buffer[32];
    snprintf(buffer, sizeof(buffer), "t%d", temp_count++);
    return strdup(buffer);
}

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

%type <str> expr mult val literal display_list


%%
/* Gramática mínima para compilar y empezar a validar estructura del lenguaje. */

program
    : PROGRAM ID DOT TBEGIN stmts END DOT   { printf("Program parsed successfully.\n"); }
    ;

stmts
    : /* vacío */
    | stmts stmt
    ;

stmt
    : io DOT
    | assig DOT
    | cond DOT
    | loop DOT
    ;

io
    : DISPLAY display_list
    | ACCEPT ID           { printf("    lee %s\n", $2); }
    ;

/* Lista de literales para DISPLAY: literal (',' literal)* */

display_list
    : literal                             { printf("    print %s\n", $1); }
    | display_list COMMA literal          { printf("    print %s\n", $3); }
    ;

literal
    : ID
    | NUM
    | CAD
    ;

/* Expresiones aritméticas con la precedencia correcta (+,-) sobre (*,/). */

expr
    : mult                                { $$ = $1; }
    | expr PLUS mult                      { char *t = new_temp(); printf("    %s := %s + %s\n", t, $1, $3); $$ = t; }
    | expr MINUS mult                     { char *t = new_temp(); printf("    %s := %s - %s\n", t, $1, $3); $$ = t; }
    ;

mult
    : val                                 { $$ = $1; }
    | mult STAR val                       { char *t = new_temp(); printf("    %s := %s * %s\n", t, $1, $3); $$ = t; }
    | mult SLASH val                      { char *t = new_temp(); printf("    %s := %s / %s\n", t, $1, $3); $$ = t; }
    ;

val
    : NUM                                 { char *t = new_temp(); printf("    %s := %s\n", t, $1); $$ = t; }
    | ID                                  { $$ = $1; }
    | LPAREN expr RPAREN                  { $$ = $2; }
    ;

/* Asignaciones aritméticas: MOVE, ADD, SUBTRACT, MULTIPLY, DIVIDE. */

assig
    : MOVE expr TO ID                     { printf("    %s := %s\n", $4, $2); }
    | ADD expr TO ID                      { printf("    %s := %s + %s\n", $4, $4, $2); }
    | SUBTRACT expr FROM ID               { printf("    %s := %s - %s\n", $4, $4, $2); }
    | MULTIPLY expr BY expr GIVING ID     { printf("    %s := %s * %s\n", $5, $2, $4); }
    | DIVIDE expr BY expr GIVING ID       { printf("    %s := %s / %s\n", $5, $2, $4); }
    ;

/* Expresiones booleanas y condicionales */

booleanExpr
    : expr IS GREATER THAN expr
    | expr IS LESS THAN expr
    | expr IS EQUAL TO expr
    | expr IS NOT GREATER THAN expr
    | expr IS NOT LESS THAN expr
    | expr IS NOT EQUAL TO expr
    ;

cond
    : IF booleanExpr THEN stmts END
    | IF booleanExpr THEN stmts ELSE stmts END
    ;

/* Bucles WHILE y VARYING */

loop
    : WHILE booleanExpr DO stmts END
    | VARYING ID FROM atomic TO atomic DO stmts END
    | VARYING ID FROM atomic TO atomic BY atomic DO stmts END
    ;

atomic
    : ID
    | NUM
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
