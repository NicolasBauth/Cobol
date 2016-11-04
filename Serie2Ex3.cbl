       PROGRAM-ID. SERIE2EX3 AS "SERIE2EX3".

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.

       INPUT-OUTPUT SECTION.
       
       FILE-CONTROL.
       
           SELECT FiEtud ASSIGN TO "U:\FichiersCobol\FiEtud.seq"
                         ORGANIZATION IS LINE SEQUENTIAL
                         FILE STATUS IS fs-fiEtud.
           SELECT OPTIONAL Listing ASSIGN TO "U:\FichiersCobol\List.seq"
                                   ORGANIZATION IS LINE SEQUENTIAL.
           
       
       DATA DIVISION.
       
       FILE SECTION.
       
       FD FiEtud.
       01 engEtud.
           02 nomPrenom                PIC X(30).
           02 codeSection              PIC XX.
               88 technique            VALUE "AU" "TI".
               88 economique           VALUE "MK" "CP" "DR" "IG".
           02 annee                    PIC 9.
           02 lettreGroupe             PIC X.
       
       FD Listing.
       01 engListe.
           02 nomEtud                  PIC X(30).
           02 login                    PIC X(34).
           02 infoStage                PIC X(30).

       WORKING-STORAGE SECTION.

       01 fs-fiEtud                    PIC XX.
           88 finFiEtud                VALUE "10".
       
       01 ligneTitre.
           02 nomPrenom-titre          PIC X(30)
                                       VALUE "Nom et prenom: ".
           02 login-titre              PIC X(34)
                                       VALUE "Login : ".
           02 infoStage-titre          PIC X(30)
                                       VALUE "Infos de stage: ".
                                       
       01 ligneEspace                  PIC X(94) VALUE SPACES.
       
       01 ligneTechnique.
           02 titreTechnique           PIC X(45)
              VALUE "Nombre d'etudiants en section technique: ".
           02 nbTechniques-ed          PIC ZZ9 VALUE 0.
           
       01 ligneEconomique.
           02 titreEconomique          PIC X(45)
              VALUE "Nombre d'etudiants en section economique: ".
           02 nbEconomiques-ed         PIC ZZ9 VALUE 0.
       
       01 nbTechniques                 PIC 999 VALUE 0.
       
       01 nbEconomiques                PIC 999 VALUE 0.
       
       PROCEDURE DIVISION.
       
       main.
           OPEN INPUT FiEtud
                OUTPUT Listing.
           READ FiEtud END-READ.
           WRITE engListe FROM ligneTitre.
           WRITE engListe FROM ligneEspace.
           PERFORM UNTIL finFiEtud
               
               IF technique
                   ADD 1 TO nbTechniques
               END-IF
               
               IF economique
                   ADD 1 to nbEconomiques
               END-IF
               
               MOVE nomPrenom TO nomEtud
               STRING codeSection  DELIMITED BY SIZE
                      annee        DELIMITED BY SIZE
                      nomPrenom    DELIMITED BY SIZE INTO login
               INSPECT infoStage REPLACING CHARACTERS BY " "
               EVALUATE codeSection
                   WHEN "AU"
                       STRING "Stage en industrie" DELIMITED BY SIZE 
                                                   INTO infoStage
                   WHEN "EF"
                       STRING "Stage chaque annee" DELIMITED BY SIZE
                                                   INTO infoStage
                   WHEN "CP"
                       STRING "Stage en deux parties" DELIMITED BY SIZE
                                                      INTO infoStage
                   WHEN "MK"
                       STRING "Stage de langue obligatoire" DELIMITED BY
                                                   SIZE INTO infoStage
                   WHEN OTHER
                       STRING "Stage de 15 semaines" DELIMITED BY SIZE
                                                       INTO infoStage
               END-EVALUATE
               WRITE engListe END-WRITE
               READ FiEtud END-READ
           END-PERFORM.
           
           MOVE nbEconomiques TO nbEconomiques-ed.
           MOVE nbTechniques TO nbTechniques-ed.
           
           PERFORM 2 TIMES
               WRITE engListe FROM ligneEspace
           END-PERFORM.
           WRITE engListe FROM ligneEconomique.
           WRITE engListe FROM ligneTechnique.
           
           CLOSE FiEtud Listing.
           STOP RUN.

       END PROGRAM SERIE2EX3.
