       program-id. ProgramCotes as "ProgramCotes".

       environment division.
       configuration section.

       data division.
       
       working-storage section.
       01 variablesStats.
           02 sommeCotes pic 999V9 value 0.
           02 moyenne pic 99V99.
           02 meilleureCote pic 99V9 value 0.
           02 pireCote pic 99V99 value 20.
       01 iCote pic 99 value 1.
       01 coteEntree pic 99V9.
       procedure division.
       main.
           perform varying iCote from 1 by 1 until iCote>10
               display "Veuillez entrer la cote numero "iCote
               accept coteEntree
               add coteEntree to sommeCotes
               if coteEntree>meilleureCote
                   move coteEntree to meilleureCote
               end-if
               if coteEntree<pireCote
                   move coteEntree to pireCote
               end-if
               
           end-perform.
           divide sommeCotes by 10 giving moyenne.
           display "La meilleure cote est de "meilleureCote.
           display "La pire cote est de "pireCote.
           display "La somme des cotes est de " sommeCotes.
           display "La moyenne est de " moyenne.    
       

           goback.

       end program ProgramCotes.
