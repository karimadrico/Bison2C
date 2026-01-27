PROGRAM SEVERAL-TYPES-OF-FOR.
BEGIN
      * Ejemplo de un for con valor inicial e incremento explícitos
      VARYING VAR FROM V TO 50 BY 3 DO
           MULTIPLY VAR BY 3 GIVING RES.
           DISPLAY RES.
      END.
      * Ejemplo de un for con incremento por defecto
      ACCEPT V.
      VARYING VAR FROM V TO 100 DO
        IF VAR IS GREATER THAN 20
        THEN
            DISPLAY VAR.
        END.
      END.
      * Ejemplo de un for con valor inicial por defecto
      VARYING VAR TO 50 BY 3 DO
           MULTIPLY VAR BY 3 GIVING RES.
           DISPLAY RES.
      END.
      * Ejemplo de un for con valor inicial e incremento inplícitos
      VARYING VAR FROM V TO 50 DO
           DISPLAY VAR.
      END.
END.
