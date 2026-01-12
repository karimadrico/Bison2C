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
.             { /* Ignorar cualquier carácter por ahora */ }
%%
int yywrap() { return 1; }
