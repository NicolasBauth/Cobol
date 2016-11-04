       PROGRAM-ID. Serie1Ex6 AS "Serie1Ex6".

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01 plaque                       PIC X(6).
       
       01 redefines plaque.
           02 lettres                  PIC X(3).
               88 lettresAAA           VALUE "AAA" "aaa".
           02 nombre                   PIC 999.
               88 nombreCorrect        VALUE 1 THRU 999.
               88 nombre007            VALUE 7.
       
       01 redefines plaque.
           02 lettre1                  PIC X.
               88 lettreCorrecte       VALUE "a" "A" THRU "n" "N".
               88 voyelle              VALUE "a" "e" "i" "o" "u" "A" "E"
      -        "I" "O" "U".
               88 lettre1X             VALUE "x" "X".
           02 lettre2                  PIC X.
               88 lettre2X             VALUE "x" "X".
           02 lettre3                  PIC X.
               88 lettre3X             VALUE "x" "X".
           02 chiffre12                PIC 99.
           02 chiffre3                 PIC 9.
               88 chiffrePair          VALUE 0 2 4 6 8.
       
       01 nbTot                        PIC 999 VALUE 0.
       01 nbVal                        PIC 999 VALUE 0.
       01 nb1                          PIC 999 VALUE 0.
       01 nb2                          PIC 999 VALUE 0.
       01 nb3                          PIC 999 VALUE 0.
       01 nb4                          PIC 999 VALUE 0.
       01 nb5                          PIC 999 VALUE 0.
       01 pourcentsValide              PIC 999V99.
       
       01 nbTot-ed                     PIC ZZ9.
       01 nbVal-ed                     PIC ZZ9.
       01 nb1-ed                       PIC ZZ9.
       01 nb2-ed                       PIC ZZ9.
       01 nb3-ed                       PIC ZZ9.
       01 nb4-ed                       PIC ZZ9.
       01 nb5-ed                       PIC ZZ9.
       01 pourcentsValide-ed           PIC ZZ9.99.
       
       PROCEDURE DIVISION.
       
       main.
           PERFORM obtenirPlaque.
           PERFORM UNTIL plaque = "zzz" OR plaque = "ZZZ"
               ADD 1 TO nbTot
               PERFORM traitementValide
               PERFORM obtenirPlaque
           END-PERFORM.
           IF nbTot NOT = 0
               COMPUTE pourcentsValide = 100 * (nbVal / nbTot)
               PERFORM affichage
           ELSE
               DISPLAY "Aucune plaque entree"
           END-IF.
           STOP RUN.
           
       obtenirPlaque.
           DISPLAY "Entrez la plaque d'immatriculation: " NO ADVANCING.
           ACCEPT plaque.
       
       traitementValide.
           IF nombreCorrect AND lettreCorrecte
               ADD 1 to nbVal
               PERFORM miseAJourCompteurs
           END-IF.
       
       miseAJourCompteurs.
           IF voyelle
               ADD 1 TO nb1
           END-IF.
           
           IF lettre1X OR lettre2X OR lettre3X
               ADD 1 TO nb2
           END-IF.
           
           IF nombre007
               ADD 1 TO nb3
           END-IF.
           
           IF lettresAAA
               ADD 1 TO nb4
           END-IF.
           
           IF chiffrePair
               ADD 1 TO nb5
           END-IF.
           
       affichage.
           MOVE nbTot TO nbTot-ed.
           DISPLAY "Nombre de plaques totales: " nbTot-ed.
           MOVE nbVal TO nbVal-ed.
           DISPLAY "Nombre de plaques valides: " nbVal-ed.
           MOVE nb1 TO nb1-ed.
           MOVE nb2 TO nb2-ed.
           MOVE nb3 TO nb3-ed.
           MOVE nb4 TO nb4-ed.
           MOVE nb5 TO nb5-ed.
           DISPLAY "Nombre de plaques commencant par voyelle: " nb1-ed.
           DISPLAY "Nombre de plaques contenant lettre X: " nb2-ed.
           DISPLAY "Nombre de plaques contenant 007: " nb3-ed.
           DISPLAY "Nombre de plaques commencant par AAA" nb4-ed.
           DISPLAY "Nombre de plaques terminant par chiffre pair: " 
      -    nb5-ed.
           MOVE pourcentsValide TO pourcentsValide-ed.
           DISPLAY "Pourcentage de plaques valides: "pourcentsValide-ed.
       
       END PROGRAM Serie1Ex6.
