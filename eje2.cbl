PROGRAM NESTED-CONTROL-STRUCTURES.
BEGIN
      * Ejemplo de condicional anidada en un bucle while
       MOVE 10 TO A.
       MOVE 0 TO B.
       WHILE A IS NOT EQUAL TO B DO
          IF B IS LESS THAN A THEN
            DISPLAY B.
          END.
          ADD 1 TO B.
       END.
      * Ejemplo de bucles anidados
       MOVE 5 TO A.
       MOVE 0 TO C.
       WHILE A IS GREATER THAN 0 DO
           SUBTRACT 1 FROM A.
           WHILE C IS LESS THAN 10 DO
             ADD 2 TO C.
             DISPLAY A, B, C.
           END.
       END.
END.
