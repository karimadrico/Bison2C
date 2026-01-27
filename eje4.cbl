PROGRAM NESTED-STRUCTURES.
BEGIN
   MOVE 5 TO A.
   MOVE 10 TO B.
   WHILE A IS GREATER THAN 0
   DO 
     SUBTRACT 1 FROM A.
     WHILE B IS GREATER THAN 0
     DO
       SUBTRACT 1 FROM B.
       WHILE B IS GREATER THAN A
       DO
            MOVE A * B TO C.
            MULTIPLY 10 BY C GIVING D.
            IF C IS GREATER THAN D THEN
                DISPLAY C.
            ELSE
                MOVE 2 * C TO V.
                VARYING VAR2 FROM V TO 100 DO
                   IF VAR2 IS GREATER THAN 0
                   THEN DISPLAY VAR2.
                   ELSE
                       VARYING VAR FROM V TO 50 BY 3 DO
                          MOVE 2 + VAR * 3 TO Z.
                          DISPLAY Z.
                       END.
                   END.
                END.
            END.
       END.
     END.
   END.
END.
