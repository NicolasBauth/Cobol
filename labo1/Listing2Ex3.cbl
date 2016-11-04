       program-id. Listing2Ex3 as "Listing2Ex3".

       environment division.
       configuration section.
       input-output section.
           file-control.
               select FiEtud assign to
                   "D:\EclipseCobol\workspace\FichiersCobol\FiEtud.seq"
                   organization is line sequential
                   file status is fs-FiEtud.
               select Listing assign to
               "D:\EclipseCobol\workspace\FichiersCobol\Listing.seq"
               organization is line sequential.
               
       data division.
       file section.
       FD FiEtud.
       01 engFiEtud.
           02 nomPrenom pic x(30).
           02 codeSection pic x(2).
           02 année pic 9.
           02 lettreGroupe pic x(1).
       FD Listing.
       01 engListing pic x(120).
           
       
       working-storage section.
       
           
       01 fs-FiEtud pic xx.
           88 finFiEtud Value "10".
       01 ligneEnTeteListing.
           02 pic x(30) Value"Nom et prénom: ".
           02 pic x(33) Value"login".
           02 pic x(25) Value"InfoStage: ".
       01 ligneListing.
           02 nom pic x(30).
           02 login.
               03 sectionLog pic x(2).
               03 annéeLog pic 9.
               03 nomPrenomLog pic x(30).
           02 infoStage pic x(25).
       01 ligneCompteListing.
           02 pic x(50) Value 
           "nombre d'étudiants de la catégorie technique:".
           02 nbEtuTech pic 999.
           02 pic x(50) Value
           ",  nombre d'étudiants de la catégorie économique:".
           02 nbEtuEco pic 999.
       
       procedure division.
       main.
           perform initGen.
           perform trtGen until finFiEtud.
           perform clotGen.
           stop run.
       initGen.
           open input FiEtud.
           open output Listing.
           move 0 to nbEtuTech.
           move 0 to nbEtuEco.
           write engListing from ligneEnTeteListing end-write.
           read FiEtud.
       trtGen.
            
           move nomPrenom to nom.
           evaluate codeSection also année
           when "AU" also 3 move"Stage en industrie" to infoStage
           when "EF" also any move"Stage chaque année" to infoStage
           when "CP" also 3 move "Stage en deux parties" to infoStage
           when "MK" also 3 move "Stage de langue obligatoire" to 
           infoStage
           when other move "Stage de 15 semaines" to infoStage
           end-evaluate.
           move année to annéeLog.
           move codeSection to sectionLog.
           move nomPrenom to nomPrenomLog.
           write engListing from ligneListing end-write.
           if codeSection equals "AU" or codeSection equals "TI"
              then add 1 to nbEtuTech
           else add 1 to nbEtuEco.
           
           read FiEtud.
       clotGen.
           write engListing from ligneCompteListing end-write.
           

       end program Listing2Ex3.
