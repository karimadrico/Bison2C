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

"PROGRAM"  { return PROGRAM; }
"BEGIN"    { return TBEGIN; }
"END"      { return END; }
"MOVE"     { return MOVE; }
"ADD"      { return ADD; }
"SUBTRACT" { return SUBTRACT; }
"MULTIPLY" { return MULTIPLY; }
"DIVIDE"   { return DIVIDE; }
"ACCEPT"   { return ACCEPT; }
"DISPLAY"  { return DISPLAY; }
"IF"       { return IF; }
"THEN"     { return THEN; }
"ELSE"     { return ELSE; }
"WHILE"    { return WHILE; }
"DO"       { return DO; }
"VARYING"  { return VARYING; }
"FROM"     { return FROM; }
"TO"       { return TO; }
"BY"       { return BY; }
"IS"       { return IS; }
"GREATER"  { return GREATER; }
"LESS"     { return LESS; }
"EQUAL"    { return EQUAL; }
"NOT"      { return NOT; }
"THAN"     { return THAN; }
"GIVING"   { return GIVING; }

"." { return DOT; }
"," { return COMMA; }
";" { return SEMICOLON; }
"(" { return LPAREN; }
")" { return RPAREN; }
"+" { return PLUS; }
"-" { return MINUS; }
"*" { return STAR; }
"/" { return SLASH; }

[ ]{6}\*.*       { /* comentario COBOL: asterisco en columna 7 */ }
\*>.*            { /* comentario COBOL en línea */ }
[ \t]+           { /* ignorar espacios y tabulaciones */ }
[\r\n]+         { /* ignorar saltos de línea */ }

\"([^\"\\\n]|\\.)*\" { yylval.str = strdup(yytext); return CAD; }
'([^'\\\n]|\\.)*'    { yylval.str = strdup(yytext); return CAD; }

[0-9]+(\\.[0-9]+)?([eE][+-]?[0-9]+)? { yylval.str = strdup(yytext); return NUM; }

[A-Z]([A-Z0-9]*(-[A-Z0-9]+)*)? { yylval.str = strdup(yytext); return ID; }
.                { /* ignorar cualquier carácter por ahora */ }
%%