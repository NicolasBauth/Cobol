       PROGRAM-ID. Serie1Ex4 AS "Serie1Ex4".

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01 tabCotes.
           02 nomEtudiant      PIC X(30) OCCURS 10.
           02 cote             PIC 99V9 OCCURS 10.
       
       01 totCotes             PIC 99V9 VALUE 0.
       01 moyenne              PIC 99V9.
       01 meilleurEtudiant     PIC X(30).
       01 pireEtudiant         PIC X(30).
       01 cotePlusElevee       PIC 99V9 VALUE 0.
       01 cotePlusBasse        PIC 99V9 VALUE 0.
       
       01 somme-ed             PIC ZZ.9.
       01 moyenne-ed           PIC ZZ.9.
       01 cotePlusElevee-ed    PIC ZZ.9.
       01 cotePlusBasse-ed     PIC ZZ.9.
       
       01 i                    PIC 99.
           
           

       PROCEDURE DIVISION.

       main.
           PERFORM initTabCotes.
           PERFORM calculSomme.
           PERFORM calculMoyenne.
           PERFORM affichage.
           STOP RUN.

       initTabCotes.
           PERFORM VARYING i FROM 1 BY 1 UNTIL i > 10
                   DISPLAY "Entrez le nom de l'etudiant: " NO ADVANCING
                   ACCEPT nomEtudiant(i)
                   DISPLAY "Entrez la cote numero " i ": " NO ADVANCING
                   ACCEPT cote(i)
                   PERFORM calculMeilleurCote
                   PERFORM calculPireCote
           END-PERFORM.

       calculSomme.
           PERFORM VARYING i FROM 1 BY 1 UNTIL i > 10
               ADD cote(i) TO totCotes
           END-PERFORM.           
       
       calculMoyenne.
           DIVIDE totCotes BY 10 GIVING moyenne.
           
       calculMeilleurCote.
           IF cotePlusElevee < cote(i)
               MOVE cote(i) TO cotePlusElevee
               MOVE nomEtudiant(i) TO meilleurEtudiant
           END-IF.
       
       calculPireCote.
           IF i = 1
               MOVE cote(i) TO cotePlusBasse
               MOVE nomEtudiant(i) TO pireEtudiant
           ELSE
               IF cote(i) < cotePlusBasse
                   MOVE cote(i) TO cotePlusBasse
                   MOVE nomEtudiant(i) TO pireEtudiant
               END-IF
           END-IF.
           
       affichage.
           MOVE totCotes TO somme-ed.
           DISPLAY "Somme : " somme-ed.
           MOVE moyenne TO moyenne-ed.
           DISPLAY "Moyenne : " moyenne-ed.
           DISPLAY "Meilleur etudiant : " meilleurEtudiant.
           MOVE cotePlusElevee TO cotePlusElevee-ed.
           DISPLAY "Meilleur cote : " cotePlusElevee-ed.
           DISPLAY "Pire etudiant : " pireEtudiant.
           MOVE cotePlusBasse TO cotePlusBasse-ed.
           DISPLAY "Pire cote : " cotePlusBasse-ed.
       
       END PROGRAM Serie1Ex4.
