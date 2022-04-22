*** Settings ***
Library    SeleniumLibrary
Resource    ../POMs/Connexion.robot
Resource    ../POMs/Dashboard.robot
Resource    ../POMs/Consultants.robot
Resource    ../../../SOCLE/baseSocle.robot
Resource    ../../../SOCLE/baseSocle.robot
Resource    ../../../SOCLE/Libs/KwLaunchCloseLogout.robot



*** Keywords ***

#AND
l'utilisateur se trouve sur la page "Consultants"
    [Documentation]    Acceder à la page "Consultants"
    Dashboard.Accéder_liste_consultants




#WHEN
l'utilisateur appuie sur le bouton d'édition sur la carte d'un consultant
    [Documentation]    Cliquer sur le bouton d'édition d'un consultant
    [Arguments]    ${nomConsultant}
    ${button_ModifConsult}    Consultants.getbuttonEditConsultantByName    ${nomConsultant}
     SeleniumLibrary.Wait Until Element Is Visible    ${button_ModifConsult}
    SeleniumLibrary.Click Element     ${button_ModifConsult}

#THEN
l'utilisateur est redirigé vers la page "modification d'un consultant"
     [Documentation]    modification d'un consultant
    SeleniumLibrary.Wait Until Page Contains Element   ${loc_pageNvConsultant_name}
    SeleniumLibrary.Element Should Contain   ${loc_pageNvConsultant_name}    ${ModifConsultantPage_name}

#GIVEN
l'utilisateur se trouve sur la page "modification d'un consultant" d'un consultant
    [Documentation]    verification qu'on est sur la page modification d'un consultant
    SeleniumLibrary.Element Should Contain   ${loc_pageNvConsultant_name}    ${ModifConsultantPage_name}


#WHEN
l'utilisateur remplace les champs d'information du consultant et clique sur Valider
     [Documentation]    Modifier les informations du consultant
    [Arguments]                ${input_consultantFirstName}    ${input_consultantLastName}    ${input_consultantEmail}    ${input_consultantManager}
    SeleniumLibrary.Wait Until Element Is Visible     ${loc_consultantFirstName}
    Consultants.Kw_Champs_Modification_consultant    ${input_consultantFirstName}    ${input_consultantLastName}    ${input_consultantEmail}    ${input_consultantManager}


#THEN
un message "Vous avez modifié le consultant" s'affiche
    [Documentation]   Verification que le Message de confirmation de modification d'un consultant s'affiche
    ${message} =   	SeleniumLibrary.Handle Alert
    Should Be Equal    ${message}   ${message_ConsulModifié}