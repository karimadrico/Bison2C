# Práctica de Bison de 2ª convocatoria
## Enunciado
Esta práctica es similar a la segunda, pero ahora en vez de usar JavaCC hay que usar Flex y Bison. Consultar los detalles concretos en la pestaña para la segunda práctica.

Notas
NOTA1: Si fuera necesario, se pueden crear nuevos no terminales con sus correspondientes producciones para agrupar de forma distinta la definición del lenguaje, o duplicar no terminales y sus correspondientes producciones para asociarles distintas reglase semánticas dependiendo de donde aparezcan los no terminales, si eso ayuda en el proceso de construir las traducciones.

NOTA2: Quizás no lo necesitéis, pero las funciones C (utilizadas en alguno de los ejemplos de los vídeos): strdup y asprintf pueden ser muy útiles (aunque no estrictamente necesarias) a la hora de resolver la práctica. Ahí dejo la pista. Si usáis asprintf, además de incluir la biblioteca adecuada con #include <stdlib.h>, para evitar el warning "implicit declaration asprintf", al compilar, necesitáis incluir la definición #define _GNU_SOURCE antes de la inclusión de la biblioteca.

NOTA3: Aunque no está explicado en los vídeos, a la hora de acceder a los valores semánticos de los elementos de una producción en Bison, además de las referencias a los valores semánticos utilizando el orden en el que aparecen los elementos en la producción: $$, $1, $2,…, se pueden utilizar referencias por nombre: $expr, $atomic,…, que pueden facilitar y hacer más clara la programación de la práctica.

NOTA4: El programa tiene que estar preparado tanto para pasarle el archivo desde la entrada estándar como para pasarle el nombre del archivo que tiene que procesar.

NOTA5: No podrá aprobarse la práctica con un parser en el que haya conflictos shift/reduce o reduce/reduce.

NOTA6: No se permite utilizar C para resolver cosas que se pueden hacer en directamente en Flex y Bison. El uso de C debe restringirse al mínimo necesario, aunque se permitirá usar funciones como strdup, asprintf, free, fprintf, fopen, perror, u otras, siempre que esté justificada la imposibilidad de hacerlo con Flex y Bison.

NOTA7: Se valorará positivamente que el código sea ordenado y claro, esté convenientemente comentado y que en los comentarios no haya faltas de ortografía.