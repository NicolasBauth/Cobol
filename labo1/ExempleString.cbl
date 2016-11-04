       program-id. ExempleString as "ExempleString".

       environment division.
       configuration section.

       data division.
       working-storage section.
       01  chaine pic x(32) value "exemple/pour#decouper#une chaine".
       01  mot1   pic x(5).
       01  mot2   pic x(10).
       01  mot3   pic x(10).
       01  mot4   pic x(3).
       01  nom    pic x(30).
       01  prenom pic x(30).
       01  texte  pic x(70).
       01  ptr    pic 99 value 1.
       01  pause  pic x.
       01  idSend pic x(20) value "123**45678??90ABCDEF".
       01  delId  pic x value "?".
       01  idR1   pic x(6).
       01  idR2   pic x(6).
       01  idR3   pic x(3).
       01  idR4   pic x(5).
       01  idD1   pic x.
       01  idD2   pic x.
       01  idD3   pic x.
       01  idC1   pic 9.
       01  idC3   pic 9.
       01  idC4   pic 9.
       01  idP    pic 99.
       01  idT    pic 99.
       procedure division.
       main.
           display chaine.
           unstring chaine delimited by "#" OR "/"
              into mot1 mot2 mot3 mot4.
           display "mot1 = " mot1.
           display "mot2 = " mot2.
           display "mot3 = " mot3.
           display "mot4 = " mot4.
           display " ".
           display "Nom : " no advancing.
           accept nom.
           display "Prenom : " no advancing.
           accept prenom.
           move spaces to texte.
           move 1      to ptr. 
           string "Bonjour " delimited by size
                  prenom     delimited by "  "
           into texte
           with pointer ptr.
           display texte.
           string space      delimited by size
                  nom        delimited by "  "
                  "!"        delimited by size
           into   texte
           with pointer ptr.
           subtract 1 from ptr.
           string "." delimited by size into texte with pointer ptr.
      * OU
      *     move "." to texte(ptr:1).
           display texte.
           display " ".
           move 1 to idP.
           move 0 to idT.
           unstring idSend delimited by delId or all "*"
               into idR1 delimiter in idD1 count in idC1
                    idR2 delimiter in idD2
                    idR3 delimiter in idD3 count in idC3
                    idR4 count in idC4
               with pointer idP
               tallying  in idT
               on overflow display "souci !".
           display "idR1 : " idR1.
           display "idD1 : " idD1.
           display "idC1 : " idC1.
           display "idR2 : " idR2.
           display "idD2 : " idd2.
           display "idR3 : " idR3.
           display "idD3 : " idD3.
           display "idC3 : " idC3.
           display "idR4 : " idR4.
           display "idC4 : " idC4.
           display "idp : " idP.
           display "idT : " idT.
           accept pause.
           stop run.

       end program ExempleString.

