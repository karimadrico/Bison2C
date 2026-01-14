/* lexer.l - Analizador léxico - Práctica de Bison de 2ª convocatoria
   Karima Drafli Rico */
%{
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}
%option noyywrap
%%

([Pp][Rr][Oo][Gg][Rr][Aa][Mm])|([Pp][Rr][Oo][Gg][Rr][Aa][Mm][Ee]) { return PROGRAM; }
[Bb][Ee][Gg][Ii][Nn] { return BEGIN; }
[Ee][Nn][Dd][.]? { return END; }
[Mm][Oo][Vv][Ee] { return MOVE; }
[Aa][Dd][Dd] { return ADD; }
[Ss][Uu][Bb][Tt][Rr][Aa][Cc][Tt] { return SUBTRACT; }
[Mm][Uu][Ll][Tt][Ii][Pp][Ll][Yy] { return MULTIPLY; }
[Dd][Ii][Vv][Ii][Dd][Ee] { return DIVIDE; }
[Aa][Cc][Cc][Ee][Pp][Tt] { return ACCEPT; }
[Dd][Ii][Ss][Pp][Ll][Aa][Yy] { return DISPLAY; }
[Ii][Ff] { return IF; }
[Tt][Hh][Ee][Nn] { return THEN; }
[Ee][Ll][Ss][Ee] { return ELSE; }
[Ww][Hh][Ii][Ll][Ee] { return WHILE; }
[Dd][Oo] { return DO; }
[Vv][Aa][Rr][Yy][Ii][Nn][Gg] { return VARYING; }
[Ff][Rr][Oo][Mm] { return FROM; }
[Tt][Oo] { return TO; }
[Bb][Yy] { return BY; }
[Ii][Ss] { return IS; }
[Gg][Rr][Ee][Aa][Tt][Ee][Rr] { return GREATER; }
[Ll][Ee][Ss][Ss] { return LESS; }
[Ee][Qq][Uu][Aa][Ll] { return EQUAL; }
[Nn][Oo][Tt] { return NOT; }
[Tt][Hh][Aa][Nn] { return THAN; }
[Gg][Ii][Vv][Ii][Nn][Gg] { return GIVING; }

"." { return DOT; }
"," { return COMMA; }
";" { return SEMICOLON; }
"(" { return LPAREN; }
")" { return RPAREN; }

^[ ]{6}\\*.*    { /* Comentario COBOL: línea con asterisco en columna 7 */ }
\\*>.*          { /* Comentario COBOL: comentario en línea */ }
[ \\t]+         { /* Ignorar espacios y tabulaciones */ }
[\\r\\n]+        { /* Ignorar saltos de línea */ }
\"([^\"\\\n]|\\.)*\" { yylval.str = strdup(yytext); return CADENA_DOBLE; }
'([^'\\\n]|\\.)*' { yylval.str = strdup(yytext); return CADENA_SIMPLE; }
[A-Za-z][A-Za-z0-9\\-]* { yylval.str = strdup(yytext); return IDENTIFICADOR; }
[0-9]+(\\.[0-9]+)?([eE][+-]?[0-9]+)? { yylval.num = atof(yytext); return NUMERO; }
.                { /* Ignorar cualquier carácter por ahora */ }
%%