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




# JavaCC A TENER EN CUENTA 
## ENUNCIADO DE Práctica de JavaCC de 2ª convocatoria
## Enunciado
Se trata de utilizar JavaCC para obtener un compilador que traduzca un lenguaje de alto nivel (con fuerte inspiración en el lenguaje COBOL) a código intermedio de tres direcciones. Básicamente lo mismo que se ha hecho en primera convocatoria pero para un nuevo lenguaje intermedio y con algunas modificaciones sobre el lenguaje de alto nivel que se está compilando.

El lenguaje de alto nivel es uno muy sencillo, una simplificación muy libre del lenguaje COBOL. No tiene declaración de tipos. Los únicos valores literales que se permiten son las cadenas de caracteres (CAD) y los valores numéricos enteros (NUM). Las cadenas de caracteres pueden ser de dos tipos, una delimitada con comillas simples, la otra delimitada con comillas dobles.

Cadenas válidas: "Esto es una 'cadena'", 'Esto "es" otra'.
Cadenas inválidas: "Hola mundo', 'finalizado".
Los nombres de variables solo pueden contener letras en mayúscula y dígitos. También pueden contener guiones (-) con la única restricción que el guion no puede iniciar o finalizar el nombre de la variable. Tampoco puede empezar por un dígito, ni coincidir con ninguna palabra reservada (las utilizadas para implementar las instrucciones, ver la gramática).

Son nombres de variables válidos: WS-A, VAR, A12, WS-2.
No son válidos nombres como: WS_A, WS*, IF, DISPLAY, -WS, WS-, 2B.
Tiene dos tipos de comentarios:

Cualquier línea con un asterisco en la columna 7 es un comentario de línea completa (es decir cualquier línea que empiece por 6 espacios seguidos por un asterisco, es ignorada por completo, es un herencia histórica de cuando se programaba usando tarjetas perforadas).
Los comentarios en las líneas de código empiezan por la secuencia *> y abarcan hasta el final de línea.
Tiene dos tipos de bucles:

Un bucle que se ejecuta mientras se verifica una condición.
Otro que utiliza una variable contador para la que se pueden proporcionar hasta tres valores, el inicial, el final y el paso de incremento. Sin embargo, el inicial y el paso son opcionales. Cuando se omiten, se utiliza en su defecto el valor 1.
La ejecución condicional utiliza una expresión booleana que permite ejecutar o no una porción de código, o ejecutar una porción de código cuando la expresión booleana es cierta o un código alternativo cuando es falsa.

Para simplificar la práctica, vamos a suponer que las variables temporales pueden contener tanto enteros positivos como números en coma flotante. Además, los valores lógicos se representaran con un valor entero, 0 para el valor de falso, con un entero positivo para el valor de cierto. Del mismo modo, supondremos que las operaciones aritméticas del código de tres direcciones son capaces de trabajar con valores de tipos distintos.

El traductor desarrollado debe ser capaz tanto de leer de la entrada estándar (teclado) como de leer del archivo cuyo nombre se le pase por argumento.

Los diagramas de trenes para los elementos del lenguaje son:
![alt text](image.png)
![alt text](image-1.png)
![alt text](image-2.png)

## Notas
NOTA1: Si fuera necesario, se pueden crear nuevos no terminales para agrupar de forma distinta la definición del lenguaje, si eso ayuda en el proceso de construir las traducciones. También se valorará la utilización de los operadores avanzados de JavaCC, como: ?, *.

NOTA2: Para reconocer el primer tipo de comentario, como en el TokenManager de JavaCC no disponemos del operador ^ para indicar concordancia a principio de línea, vamos a suponer que este tipo de comentario nunca puede aparecer en la primera línea, con lo que para reconocer este comentario en el resto de líneas se puede usar el fin de línea de la línea previa.

## Ejemplos
Algunos ejemplos de las entradas y salidas esperadas se muestran en el siguiente archivo: ejemplosP2y3_2C.zip.

══════════════════════════════════════════════════════════════════════════════

## Nota histórica
COBOL (Common Business-Oriented Language) fue uno de los primeros lenguajes de alto nivel, diseñado específicamente para aplicaciones de negocio. Fue desarrollado en 1959 por un comité conocido como la Conferencia sobre Lenguajes de Sistemas de Datos (CODASYL), bajo la dirección del Departamento de Defensa de los Estados Unidos. Fue creado para resolver problemas relacionados con la gestión de datos en empresas e instituciones, ofreciendo una forma de programar más cercana al lenguaje natural, accesible para personas no especializadas en programación. Su sintaxis está orientada a la descripción de procesos de negocio, lo que facilita la comprensión del código incluso para personas sin experiencia técnica profunda.

A pesar de los avances en la tecnología y el desarrollo de lenguajes más modernos, COBOL ha mantenido su relevancia durante más de seis décadas. Muchas aplicaciones críticas, especialmente en la banca, los seguros y el gobierno, siguen usando COBOL. Se estima que más de 70% de las transacciones empresariales globales todavía son procesadas por sistemas basados en COBOL. Esto incluye sistemas bancarios, cajeros automáticos, y otros sistemas financieros que requieren alta fiabilidad.

Aunque COBOL ha sido considerado anticuado, ha demostrado ser adaptable. Existen versiones modernas del lenguaje que se integran con tecnologías como bases de datos relacionales, interfaces web, y servicios en la nube. A lo largo de los años, COBOL ha evolucionado, pero su estructura sigue siendo muy reconocible y ha influido en el desarrollo de otros lenguajes de programación.

En esta práctica, hemos utilizado una versión simplificada muy libre de COBOL, que implementa algunas de sus características, pero donde se han ignorado un montón de otras características muy típicas de COBOL, tales como la estructura jerárquica (que comprende divisiones, secciones, párrafos, sentencias y verbos), las restricciones respecto a en qué columna tienen que empezar las líneas y la declaración de variables de almacenamiento, que en COBOL es bastante única y distintiva en comparación con los lenguajes de programación modernos.


# Ejecutar
cd /cygdrive/c/Users/kdraf/Downloads/Bison2C/Bison2C
Esto genera los archivos necesarios con Bison y Flex: 
bison -v -d parser.y 
flex lexer.l

Compilar: 
gcc -o compilador parser.tab.c lex.yy.c -lfl

Ejecutar el compilador con un archivo de ejemplo: 
./compilador ejemplo1.txt 
./compilador ejemplo2.txt 
./compilador ejemplo3.txt