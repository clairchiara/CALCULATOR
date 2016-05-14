      ******************************************************************
      * Author: Clair Marchesani
      * Date: 12 May 2016
      * Purpose: Self-Study / Demonstration
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULATOR.
       AUTHOR CLAIR MARCHESANI.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           CLASS VALID-NUMERIC IS
           '0' THROUGH '9'
           '-'
           '.'
           ' '
           '+'
           CLASS VALID-OPERATOR IS
           "+"
           "-"
           "x"
           "*"
           "/"
           ":"
           "^".
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  INITIAL-QUESTION        PIC A(1).
       01  NUM-INPUT               PIC X(9).
       01  NUM-INPUT-DOT-COUNTER   PIC 9(5).
       01  NUM-INPUT-SIGN-COUNTER  PIC 9(5).
       01  FULL-OPERATION.
           02  OPERATION.
               03  OPERAND1        PIC S9(5)V9(3).
               03  OPERATOR        PIC A.
               03  OPERAND2        PIC S9(5)V9(3).
           02  RESULT              PIC S9(5)V9(3).
       01  DROP-LEAD-ZEROES        PIC -ZZ,ZZZ.999.
       PROCEDURE DIVISION.

       BEGIN.
           DISPLAY
           "Would you like to use the expression solver instead?"
           ACCEPT INITIAL-QUESTION
           IF INITIAL-QUESTION EQUALS 'Y' THEN
           CALL "EXPRESSION-SOLVER"
           DISPLAY "Please input first operand"
           ACCEPT NUM-INPUT
           PERFORM CHECK-INPUT
           MOVE NUM-INPUT TO OPERAND1.

       INPUT-OPERATOR.
           DISPLAY "Please input operator, enter nothing to terminate"
           ACCEPT OPERATOR
           PERFORM CHECK-OPEATOR
           DISPLAY "Please input second operand"
           ACCEPT NUM-INPUT
           PERFORM CHECK-INPUT
           MOVE NUM-INPUT TO OPERAND2
           PERFORM CALCULATION
           PERFORM PREPARE-FOR-OUTPUT
           DISPLAY "The result is " DROP-LEAD-ZEROES
           PERFORM CONTINUATION.

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
           DISPLAY "Please input operator again"
           ACCEPT OPERATOR
           PERFORM CHECK-OPEATOR.

       INCORRECT-OPERAND.
           DISPLAY "Please input operand again"
           ACCEPT NUM-INPUT
           PERFORM CHECK-INPUT.

       PREPARE-FOR-OUTPUT.
           ADD RESULT TO ZERO
           GIVING DROP-LEAD-ZEROES ROUNDED.

       CONTINUATION.
           MOVE RESULT TO OPERAND1
           PERFORM INPUT-OPERATOR.

       CHECK-INPUT.
           MOVE 0 TO NUM-INPUT-DOT-COUNTER
           MOVE 0 TO NUM-INPUT-SIGN-COUNTER
           INSPECT NUM-INPUT TALLYING NUM-INPUT-DOT-COUNTER FOR ALL '.'
           INSPECT NUM-INPUT TALLYING NUM-INPUT-SIGN-COUNTER FOR ALL '-'
           INSPECT NUM-INPUT TALLYING NUM-INPUT-SIGN-COUNTER FOR ALL '+'
           IF NUM-INPUT IS NOT VALID-NUMERIC
               OR NUM-INPUT-DOT-COUNTER IS GREATER THAN 1
               OR NUM-INPUT-SIGN-COUNTER IS GREATER THAN 1 THEN
               PERFORM INCORRECT-OPERAND
           END-IF.

       CHECK-OPEATOR.
           IF OPERATOR EQUALS '' THEN
               STOP RUN
           ELSE IF OPERATOR IS NOT VALID-OPERATOR THEN
               PERFORM INCORRECT-OPERATOR
           END-IF.

       END PROGRAM CALCULATOR.
