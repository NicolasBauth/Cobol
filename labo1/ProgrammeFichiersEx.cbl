       program-id. ProgrammeFichiersEx as "ProgrammeFichiersEx".

       environment division.
       configuration section.
       input-output section.
       file-control.
       select FiClients 
           assign to 
       "D:\EclipseCobol\workspace\FichiersCobol\Clients.seq"
           organization is line sequential
           file status is fs-FiClients.
           select FiSortie assign to
               "D:\EclipseCobol\workspace\FichiersCobol\Sortie.seq"
                   organization is line sequential
                   file status is fs-FiSortie.
       
       data division.
       file section.
       FD Ficlients.
       01 engFiClients.
           02 nom pic x(30).
           02 montAchats   pic 9(4)v99 occurs 12.
      
       FD FiSortie.
       01 engSortie pic x(90).
       working-storage section.
       01 fs-FiClients pic xx.
           88 finFiClients value "10".
       01 fs-FiSortie pic xx.
           88 finFiSortie value "10".
       01 montAnnuelAchats pic 9(6)v99.
       
       
       01 i    pic 99.
       01 pause    pic x.
       01 ligneTitre.
               02  pic x(30) value "NOM".
               02  pic x(24) value "Total annuel des achats".
       01 ligneClientsEd.
               02 nomEd    pic x(31).
               02 montAnnuelAchatsEd   pic zzzBzz9.99.
               02  pic x(6) value " euros".
               
       
       procedure division.
       main.
           perform initgen.
           perform affichage.
           perform trtGen until finFiClients.
           perform clotGen.
           accept pause.
           stop run.
       initGen.
           open input FiClients.
           open output FiSortie.
           read FiClients.
       affichage.
           write engSortie from ligneTitre end-write.
       trtGen.
           move 0 to montAnnuelAchats.
           perform varying i from 1 by 1 until i>12
               add montAchats(i) to montAnnuelAchats
           end-perform.
           move nom to nomEd.
           move montAnnuelAchats to montAnnuelAchatsEd.
           write engSortie from ligneClientsEd
           end-write.
           read FiClients.
       clotGen.
           close FiClients.

       

       end program ProgrammeFichiersEx.
