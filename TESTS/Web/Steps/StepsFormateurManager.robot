*** Settings ***
Library    SeleniumLibrary
Resource    ../POMs/Connexion.robot
Resource    ../POMs/Dashboard.robot
Resource    ../POMs/CommunPOMs.robot
Resource    ../../../SOCLE/baseSocle.robot
Resource    ../../../SOCLE/baseSocle.robot
Resource    ../../../SOCLE/Libs/KwLaunchCloseLogout.robot
*** Keywords ***
# GIVEN
 l'utilisateur est connecté en tant que admin
     [Documentation]    L'utilisateur accède à la page de connexion
     KwLaunchCloseLogout.Kw_launch_browser    ${site_web}[url]     ${site_web}[title]
     Connexion.Kw_Login    ${compte_admin.userName}    ${compte_admin.pwd} 
###################################formateur##############################################################
# AND
 l'utilisateur est sur la page formulaire "création d'un formateur"
     Dashboard.Accéder_formulaire_formateur
###################################"#######manager#################################################
 l'utilisateur est sur la page formulaire "création d'un manager"
     Dashboard.Accéder_formulaire_Manager
# WHEN
l'utilisateur renseigne les champs
    [Arguments]  ${prenom}  ${nom}  ${mail}  ${mdp}
     Remplir_formulaire  ${prenom}  ${nom}  ${mail}  ${mdp}
# And
 l'utilisateur clique sur le boutton valider  
    valider la création
###########################cas non passant formateur/manager############################################
# THEN
un message de succès est affiché "Cet e-mail est déjà utilisé !"
  Verfication_creation  Cet e-mail est déjà utilisé !
  ####################################cas  passant formateur###############################################################################
 # THEN  
un message de succès est affiché " Vous avez créé un formateur !
   Verfication_creation    Vous avez créé un formateur !  # Vous avez créé un formateur !
   #####################################cas passant manager############################################################# # THEN  
un message de succès est affiché " Vous avez créé un manager !
   Verfication_creation    Vous avez créé un manager !  # Vous avez créé un formateur !