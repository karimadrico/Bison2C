/* lexer.l - Analizador léxico - Práctica de Bison de 2ª convocatoria
   Karima Drafli Rico */
%{
#include "parser.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}
%option noyywrap
%%
"PROGRAMA"   { return PROGRAMA; }
"INICIO"     { return INICIO; }
"FIN"        { return FIN; }
"LEE"        { return LEE; }
"MUESTRA"    { return MUESTRA; }
"EJECUTA"    { return EJECUTA; }
"FIN-EJECUTA"{ return FIN_EJECUTA; }
"VECES"      { return VECES; }
"USANDO"     { return USANDO; }
"HASTA-QUE"  { return HASTA_QUE; }
"ENTONCES"   { return ENTONCES; }
"MUEVE"      { return MUEVE; }
"A"          { return A; }
"MAYOR"      { return MAYOR; }
"MENOR"      { return MENOR; }
"ENTRE"      { return ENTRE; }
"SINO"       { return SINO; }
"SI"         { return SI; }
"FIN-SI"     { return FIN_SI; }
"NO"         { return NO; }
"DANDO"      { return DANDO; }
"CALCULA"    { return CALCULA; }
"SUMA"       { return SUMA; }
"RESTA"      { return RESTA; }
"MULTIPLICA" { return MULTIPLICA; }
"DIVIDE"     { return DIVIDE; }
"FIN-CALCULA"{ return FIN_CALCULA; }

\*.*            { /* Comentario COBOL: línea que empieza por * */ }
\*>.*           { /* Comentario COBOL: línea que empieza por *> */ }
[ \t]+          { /* Ignorar espacios y tabulaciones */ }
\n              { /* Ignorar saltos de línea */ }
"([^"\\]|\\.)*" { /* Cadena entre comillas dobles */ }
'([^'\\]|\\.)*' { /* Cadena entre comillas simples */ }
[A-Z]([A-Z0-9\-]*[A-Z0-9])? { /* Identificador */ }
[0-9]+          { /* Número */ }
.               { /* Ignorar cualquier carácter por ahora */ }
%%