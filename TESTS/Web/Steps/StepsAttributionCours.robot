*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Comptes.robot
Resource    ../POMs/Connexion.robot
Resource    ../POMs/Dashboard.robot
Resource    ../POMs/CoursOuCursus.robot
Resource    ../POMs/Consultants.robot
Resource    ../../../SOCLE/baseSocle.robot
Resource    ../../../SOCLE/baseSocle.robot
Resource    ../../../SOCLE/Libs/KwLaunchCloseLogout.robot
  

*** Keywords ***
# GIVEN
l'utilisateur est connecté en tant que manager
    KwLaunchCloseLogout.Kw_launch_browser    ${site_web}[url]     ${site_web}[title]
    Connexion.Kw_Login    ${compte_manager.userName}    ${compte_manager.pwd}
# AND
l'utilisateur a selectionné le cours 
  [Arguments]  ${titre_cours}
  Dashboard.Accéder_liste_cours
  Attribuer_un_cours_cursus  ${titre_cours}
  BuiltIn.Set Global Variable    ${titre_cours}
# AND
ce cours n'est pas attribué et sur la liste des consultants se trouve le nom du
  [Arguments]  ${nom_consultant}
    Verification_consultant  ${nom_consultant}
   
# WHEN
l'utilisateur sélectionne à ce consultant
  Selectionner_consultant  
# THEN
le message " consultant a bien été assigné au cours" s'affiche
  Verfication_message_assigniation
# AND
le cours se trouve dans la liste des cours du consultant
  [Arguments]  ${nom_consultant}  
  Dashboard.Accéder_liste_consultants
  afficher_page_consultant  ${nom_consultant}
  existence_cours  ${titre_cours} 
  

