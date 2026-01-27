PROGRAM EXAMPLE1.
      * Comentario COBOL de asterisco en columna 7
BEGIN  *> otro comentario
  MOVE 5 * 25 TO VAR.   *> La variable VAR toma el valor de 5 * 25 
  ACCEPT V.             *> Leer un valor para la variable V        
  DISPLAY 2.34e-10.
  WHILE VAR IS GREATER THAN 0 DO *> bucle para decrementar var              
    SUBTRACT 2 * V FROM VAR.
  END.
  IF 5 - VAR IS GREATER THAN 0 *> Condicional                             
  THEN
      * Rama THEN
        SUBTRACT 1 FROM V.
        MULTIPLY 3 BY V GIVING Z.
        DISPLAY "3*(V-1) es: ", Z.
  ELSE
      * Rama ELSE
        MOVE VAR + 10 TO Z.
        DISPLAY 'VAR + 10 es: ', Z.
  END.
END.
