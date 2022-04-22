*** Settings ***
Library    SeleniumLibrary
Resource    ../POMs/Connexion.robot
Resource    ../POMs/Dashboard.robot
Resource    ../POMs/Consultants.robot
Resource    ../../../SOCLE/baseSocle.robot
Resource    ../../Data/Locators.robot
Resource    ../../../SOCLE/Libs/KwLaunchCloseLogout.robot



*** Keywords ***

#GIVEN 
l'utilisateur connecté est de profil manager
    [Documentation]    Connexion avec les identifiants manager
    KwLaunchCloseLogout.Kw_launch_browser    ${site_web}[url]     ${site_web}[title]
     Connexion.Kw_Login    ${compte_manager.userName}    ${compte_manager.pwd}
    
    
# WHEN
l'utilisateur clique sur l'onglet "Consultants"
    [Documentation]    Accès à la page consultant via l'onglet consultant

    SeleniumLibrary.Wait Until Element Is Visible    ${loc_ongletConexion}
    SeleniumLibrary.Click Element     ${loc_ongletConexion}


#THEN
l'utilisateur est redirigé vers la page "consultants"
     [Documentation]    La page consultant est ouverte
    SeleniumLibrary.Wait Until Page Contains Element   ${loc_pageConsultant_name}
    SeleniumLibrary.Element Should Contain    ${loc_pageConsultant_name}    ${consultantPage_name}


#GIVEN
L'utilisateur se trouve sur la page "consultant"
    [Documentation]    Vérification qu'on est bien sur la page consultant
    KwLaunchCloseLogout.Kw_launch_browser    ${site_web}[url]     ${site_web}[title]
    Connexion.Kw_Login    ${compte_manager.userName}    ${compte_manager.pwd}
    ${textElement}  SeleniumLibrary.Get Text    ${loc_pageConsultant_name}
    ${test} =  Evaluate  $textElement != $consultantPage_name
     IF  ${test}
     Go To    https://tipoca-recette.sogelabs.com/consultants
     END
#WHEN
l'utilisateur Clique sur le bouton "Ajouter un consultant"
     [Documentation]    Le bouton "ajouter un consultant" existe et l'utilisateur clique dessus
    SeleniumLibrary.Wait Until Page Contains Element   ${btn_AjouterConsultant}
    SeleniumLibrary.Click Element     ${btn_AjouterConsultant}

#THEN
Il est redirigé sur la page "Nouveau consultant"
     [Documentation]    La page "Nouveau consultant" est ouverte
    SeleniumLibrary.Wait Until Page Contains Element   ${loc_pageNvConsultant_name}
    SeleniumLibrary.Element Should Contain   ${loc_pageNvConsultant_name}    ${nvConsultantPage_name}

#GIVEN
L'utilisateur se trouve sur la page "Création d'un consultant"
    [Documentation]    Verification qu'on est sur la page nouveau consultant
    KwLaunchCloseLogout.Kw_launch_browser    ${site_web}[url]     ${site_web}[title]
    Connexion.Kw_Login    ${compte_manager.userName}    ${compte_manager.pwd}
    ${textElement}  SeleniumLibrary.Get Text    ${loc_pageNvConsultant_name}
    ${test} =  Evaluate  $textElement != $nvConsultantPage_name
     IF  ${test}
     Go To    https://tipoca-recette.sogelabs.com/consultants/new
     END

#WHEN
L'utilisateur remplit les champs d'information pour la création d'un consultant
    [Documentation]    Remplissage des informations du nouveau consultant
    [Arguments]    ${consultantFirstName}    ${consultantLastName}    ${consultantEmail}    ${consultantPassword} 
    SeleniumLibrary.Wait Until Page Contains Element   ${loc_prénom}
    Consultants.Kw_Champs_Creation_Consultant    ${consultantFirstName}    ${consultantLastName}    ${consultantEmail}    ${consultantPassword} 


#THEN
Une pop up avec le message Vous avez créé un consultant ! s'affiche
    [Documentation]    Message de confirmation création d'un consultant
    ${message} =   	SeleniumLibrary.Handle Alert
    Should Be Equal    ${message}   ${message_ConsulCree}



#THEN
Une pop up avec le message 'Cet e-mail est déjà utilisé ! s'affiche
    [Documentation]   Verification que le Message Erreur Email s'affiche
    ${message} =   	SeleniumLibrary.Handle Alert
    Should Be Equal    ${message}   ${message_erreurEmail}


#When
L'utilisateur ne remplit pas tous les champs d'information pour la création d'un consultant
    [Documentation]    Remplissage des informations des informations en ometant un champs de saisit et validation
    [Arguments]    ${consultantFirstName}    ${consultantLastName}       ${consultantPassword}
    SeleniumLibrary.Wait Until Page Contains Element   ${loc_prénom}
    SeleniumLibrary.Clear Element Text    ${loc_email}
    Consultants.Kw_Champs_Incomplet_Creation_Consultant    ${consultantFirstName}    ${consultantLastName}       ${consultantPassword}

#Then
l'utilisateur n'est pas redirigé vers la page "Consultants"
     SeleniumLibrary.Wait Until Page Contains Element   ${loc_pageNvConsultant_name}
    SeleniumLibrary.Element Should not Contain    ${loc_pageNvConsultant_name}    ${consultantPage_name}