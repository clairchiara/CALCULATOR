      ******************************************************************
      * Author: Clair Marchesani
      * Date: 14 May 2016
      * Purpose: Self-Study / Demonstration
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EXPRESSION-SOLVER.
       AUTHOR CLAIR MARCHESANI.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           CLASS VALID-NUMERIC IS
           '0' THROUGH '9'
           '-'
           '.'
           ' '
           CLASS VALID-OPERATOR IS
           "+"
           "-"
           "x"
           "*"
           "/"
           ":"
           "^".
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       LINKAGE SECTION.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "Expression solver not yet complete, sorry!"
           STOP RUN.
       END PROGRAM EXPRESSION-SOLVER.
