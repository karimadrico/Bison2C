/* lexer.l - Analizador léxico - Práctica de Bison de 2ª convocatoria
   Karima Drafli Rico */
%{
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}
%option noyywrap
%%

PROGRAM  { return PROGRAM; }
BEGIN    { return BEGIN; }
END      { return END; }
MOVE     { return MOVE; }
ADD      { return ADD; }
SUBTRACT { return SUBTRACT; }
MULTIPLY { return MULTIPLY; }
DIVIDE   { return DIVIDE; }
ACCEPT   { return ACCEPT; }
DISPLAY  { return DISPLAY; }
IF       { return IF; }
THEN     { return THEN; }
ELSE     { return ELSE; }
WHILE    { return WHILE; }
DO       { return DO; }
VARYING  { return VARYING; }
FROM     { return FROM; }
TO       { return TO; }
BY       { return BY; }
IS       { return IS; }
GREATER  { return GREATER; }
LESS     { return LESS; }
EQUAL    { return EQUAL; }
NOT      { return NOT; }
THAN     { return THAN; }
GIVING   { return GIVING; }

"." { return DOT; }
"," { return COMMA; }
";" { return SEMICOLON; }
"(" { return LPAREN; }
")" { return RPAREN; }
"+" { return PLUS; }
"-" { return MINUS; }
"*" { return STAR; }
"/" { return SLASH; }

/* Comentario COBOL: 6 espacios y '*' (columna 7) */
[ ]{6}\*.*       { /* ignorar línea completa */ }
\*>.*            { /* Comentario COBOL: comentario en línea */ }
[ \\t]+         { /* Ignorar espacios y tabulaciones */ }
[\\r\\n]+       { /* Ignorar saltos de línea */ }

\"([^\"\\\n]|\\.)*\" { yylval.str = strdup(yytext); return CAD; }
'([^'\\\n]|\\.)*'    { yylval.str = strdup(yytext); return CAD; }

/* NUM permite enteros, decimales y notación científica (ver ejemplos del profesor) */
[0-9]+(\\.[0-9]+)?([eE][+-]?[0-9]+)? { yylval.str = strdup(yytext); return NUM; }

/* ID: solo mayúsculas, dígitos y guiones; sin empezar/terminar con guion */
[A-Z]([A-Z0-9]*(-[A-Z0-9]+)*)? { yylval.str = strdup(yytext); return ID; }
.                { /* Ignorar cualquier carácter por ahora */ }
%%