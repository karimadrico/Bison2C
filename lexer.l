/* Práctica de Bison de 2ª convocatoria
   Karima Drafli Rico */
%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
%}
%option noyywrap
%%
// ...aquí irán las reglas léxicas...

.   { /* Ignorar cualquier carácter por ahora */ }
%%
int yywrap() { return 1; }
