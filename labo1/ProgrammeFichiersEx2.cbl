       program-id. ProgrammeFichiersEx2 as "ProgrammeFichiersEx2".

       environment division.
       configuration section.
       input-output section.
           file-control.
               select FiOuv assign to
               "D:\EclipseCobol\workspace\FichiersCobol\FiOuv.seq"
               organization is line sequential
               file status is fs-FiOuv.
               select Listing assign to
               "D:\EclipseCobol\workspace\FichiersCobol\Liste4.seq"
                   organization is line sequential.
               
       data division.
       file section.
       FD FiOuv.
       01 engClient.
           02 nomOuvrier   pic x(30).
           02 nomClient pic x(30).
           02 nbHPrest pic 99 occurs 5.
       01 engSignaletiqueOuvrier.
           02  pic x(30).
           02 txHor    pic 99v99.
       FD Listing.
       01 engListing   pic x(80).
       working-storage section.
       01 fs-FiOuv pic xx.
           88 finFiOuv value "10".
       01 engSignaletiqueSauve.
           02 nomOuvrierSauve pic x(30).
           02 txHorSauve pic 99v99.
       01 ligneNomOuvrier.
           02  pic x(10) value "Ouvrier : ".
           02 nomOuvrierEd pic x(30).
       01 ligneTitreClient.
           02 pic x(9) value " Client".
           02 pic x(25) value spaces.
           02 pic x(15) value "Heures prestees".
       01 ligneClient.
           02 pic x(3) value spaces.
           02 nomClientEd pic x(30).
           02 pic xxx value spaces.
           02 nbHPrestClientEd pic Z9.
           02 pic xx value " h".
       01 ligneSalaireOuvrier.
           02  pic x(10) value "Salaire : ".
           02 salaireEd    pic zzBzz9.99.
           02  pic x(6) value " euros".
       01 nbTotalHPrest    pic 999.
       01 nbHPrestClient   pic 999.
       01 i    pic 9.
           
       procedure division.
       mainExemple4.
           perform InitGen.
           perform TrtGen until finFiOuv.
           perform ClotGen.
           stop run.
       TrtGen.
           perform InitOuvrier.
           perform TrtOuvrier until finFiOuv
                                   OR nomOuvrier NOT = nomOuvrierSauve.
           perform ClotOuvrier.
       InitGen.
           open input FiOuv
               output Listing.
           read FiOuv end-read.
       InitOuvrier.
           move engSignaletiqueOuvrier to engSignaletiqueSauve.
           move 0  to nbTotalHprest.
           move nomOuvrier to nomOuvrierEd.
           write engListing from ligneNomOuvrier.
           write engListing from ligneTitreClient.
           read FiOuv end-read.
       TrtOuvrier.
           move 0 to nbHPrestClient.
           perform varying i from 1 by 1 until i>5
               add nbHPrestClient to nbTotalHPrest.
               move nomClient to nomClientEd.
               move nbHPrestClient to nbHPrestClientEd.
               write engListing from ligneClient.
               read FiOuv end-read.
       ClotOuvrier.
           multiply nbTotalHPrest by txHorSauve giving salaireEd.
           write engListing from ligneSalaireOuvrier.
           write engListing from spaces.
       ClotGen.
           close FiOuv Listing.
       
       end program ProgrammeFichiersEx2.
