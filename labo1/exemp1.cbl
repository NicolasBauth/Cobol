       program-id. exemp1 as "exemp1".

       environment division.
       configuration section.

       data division.
       working-storage section.
       01 tableau.
           05 nombre occurs 20 pic 999.
       01 variables.
           02 total    pic 9(5).
           02 resultat pic 999.
           02 reste pic 9.
               88 multiple5 value 0.
       01 variables-ed.
           02 total-ed pic z(4)9.
           02 nombre-ed pic zz9.
       01 i    pic 99.
       procedure division.
       main.
           perform varying i from 1 by 1 until i>20
               display "Encodez le nombre numero " i
               accept nombre(i)
           end-perform.
           move 0  to total.
           perform varying i from 1 by 1 until i>20
               add nombre(i) to total
               move nombre(i) to nombre-ed
               divide nombre(i) by 5 giving resultat remainder reste
               if multiple5
                   display nombre-ed " multiple de 5"
               else
                   display nombre-ed " non multiple de 5"
               end-if
            end-perform.
            display "total du tableau:" total.
           goback.

       end program exemp1.
