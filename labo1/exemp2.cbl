       program-id. exemp2 as "exemp2".

       environment division.
       configuration section.

       data division.
       working-storage section.
       01 val-tab.
           05 pic x(10) value "Dewit".
           05 pic x(16) value "Brabant".
           05 pic x(10) value "Deblauw".
           05 pic x(16) value "Flandre".
           05 pic x(10) value "Derood".
           05 pic x(16) value "Limbourg-Anvers".
           05 pic x(10) value "Leblanc".
           05 pic x(16) value "Hainaut-Namur".
           05 pic x(10) value "Lenoir".
           05 pic x(16) value "Liege-Luxembourg".
       01 tabCourtier redefines val-tab.
           02 cellule occurs 5.
               05 nomCourt pic x(10).
               05 libZone pic x(16).
       01 tabVentes.
           02 cellCourtier occurs 5.
               03 cellJour occurs 6.
                   04 montantVie pic 9(6)V99.
                   04 montantNonVie pic 9(6)V99.
       01 totaux.
           02 totalVie pic 9(8)V99.
           02 totalNonVie pic 9(8)V99.
       01 total-ed pic zzBzzzBzz9.99.
       
       01 indices.
           02 i pic 9.
           02 j pic 9.
           
       01 aAffecter pic 9(5)V99.
               

       procedure division.
       main.
           perform init.
           perform calcul.
           perform affichage.
           stop run.
       init.
           initialize tabVentes.
           perform varying i from 1 by 1 until i>5
               perform varying j from 1 by 1 until j>6
                   move 0 to aAffecter
                   add i to aAffecter
                   add j to aAffecter
                   move aAffecter to montantVie(i j)
                   move aAffecter to montantNonVie(i j)
               end-perform
           end-perform.
       calcul.
           initialize totaux.
           perform varying i from 1 by 1 until i>5
               perform varying j from 1 by 1 until j>6
                   add montantVie(i j) to totalVie
                   add montantNonVie(i j) to totalNonVie
               end-perform
           end-perform.
       affichage.
           move totalVie to total-ed.
           display "total pour la branche vie:" total-ed " euros".
           move totalNonVie to total-ed.
           display "total pour la branche non vie:" total-ed " euros".
       

       goback.

       end program exemp2.
