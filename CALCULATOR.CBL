      ******************************************************************
      * Author: Clair Marchesani
      * Date: 12 May 2016
      * Purpose: Self-Study / Demonstration
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULATOR.
       AUTHOR CLAIR MARCHESANI.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  NUMS.
           10  OPERANDS.
               20  OPERAND1        PIC S9(5)V9(3).
               20  OPERAND2        PIC S9(5)V9(3).
           10  RESULT              PIC S9(5)V9(3).
           10  DROP-LEAD-ZEROES    PIC -ZZ,ZZZ.999.
       01  OPERATOR                PIC A.
       PROCEDURE DIVISION.
       BEGIN.
            DISPLAY "Please input first operand".
            ACCEPT OPERAND1.
       INPUT-OPERATOR.
            DISPLAY "Please input operator".
            ACCEPT OPERATOR.
            DISPLAY "Please input second operand".
            ACCEPT OPERAND2.
            PERFORM CALCULATION.
            PERFORM PREPARE-FOR-OUTPUT.
            DISPLAY "The result is " DROP-LEAD-ZEROES.
            STOP RUN.

       CALCULATION.
            IF OPERATOR EQUALS "+" THEN
                COMPUTE RESULT = OPERAND1 + OPERAND2
            ELSE IF OPERATOR EQUALS "-" THEN
                COMPUTE RESULT = OPERAND1 - OPERAND2
            ELSE IF OPERATOR EQUALS "x" OR "*" THEN
                COMPUTE RESULT = OPERAND1 * OPERAND2
            ELSE IF OPERATOR EQUALS "/" OR ":" THEN
                COMPUTE RESULT = OPERAND1 / OPERAND2
            ELSE IF OPERATOR EQUALS "^"
                COMPUTE RESULT = OPERAND1 ** OPERAND2
            ELSE
                DISPLAY "Incorrect operator!"
                PERFORM INCORRECT-OPERATOR
                PERFORM CALCULATION
            END-IF.

       INCORRECT-OPERATOR.
            DISPLAY "Please input operator again".
            ACCEPT OPERATOR.

       PREPARE-FOR-OUTPUT.
            ADD RESULT TO ZERO
            GIVING DROP-LEAD-ZEROES ROUNDED.

       END PROGRAM CALCULATOR.
