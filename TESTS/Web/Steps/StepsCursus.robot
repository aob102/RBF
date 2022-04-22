*** Settings ***
Library    SeleniumLibrary
Resource    ../POMs/Connexion.robot
Resource    ../POMs/Dashboard.robot
Resource    ../POMs/CoursOuCursus.robot
Resource    ../POMs/Consultants.robot
Resource    ../../../SOCLE/baseSocle.robot
Resource    ../../../SOCLE/baseSocle.robot
Resource    ../../../SOCLE/Libs/KwLaunchCloseLogout.robot
Resource    ../POMs/CommunPOMs.robot
*** Keywords ***
# When
l'utilisateur a selectionne le cursus 
    [Arguments]  ${titre_cursus}
  Dashboard.Accéder_liste_cursus
  CoursOuCursus.Attribuer_un_cours_cursus  ${titre_cursus}
  Set Global Variable    ${titre_cursus}
  # And
ce cursus n'est pas attribué et la liste des consultants contient
  [Arguments]  ${nom_consultant}
    CoursOuCursus.Verification_consultant  ${nom_consultant}
#And 
l'utilisateur sélectionne le cursus à ce consultant
  CoursOuCursus.Selectionner_consultant
    # Then
    
le message "1 consultant a bien été assigné au cursus" s'affiche
   CoursOuCursus.Verfication_message_assigniation
# And
le consultant reçoit une notification
  KwLaunchCloseLogout.Kw_LogOut
  Connexion.Kw_Login    ${compte_consultant.userName}    ${compte_consultant.pwd}
  Accéder_notification
  Notification_Assignation  ${titre_cursus}

