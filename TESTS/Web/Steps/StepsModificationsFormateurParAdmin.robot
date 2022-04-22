*** Settings ***
Library    SeleniumLibrary
Resource    ../POMs/Connexion.robot
Resource    ../../../SOCLE/Libs/KwLaunchCloseLogout.robot
Resource    ../../../SOCLE/Libs/selenium.robot
Resource    ../Steps/StepsConnexion.robot
Resource    ../../Data/Locators.robot

*** Variables ***
${loc_liste_formateur}   css=a:nth-child(5) .navlink-img 
${loc_first_formateur}    //*[@id="root"]/div/main/ul/li[1]
${loc_valider}    css=.button 
${test_prenom}    test_prenom4
${test_nom}    test_nom2
${test_email}    test_email@sogeti.com4
*** Keywords ***
# GIVEN
 l'utilisateur est connecté avec le profil Admin
     [Documentation]    L'utilisateur est connecté en tant qu'admin
     [Tags]    WEB
     StepsConnexion.l'utilisateur est sur la page de connexion
     StepsConnexion.l'utilisateur renseigne les champs "Email" et "Mot de passe" en tant que administrateur
l'utilisateur se trouve sur la page "Formateurs"
     [Tags]    WEB
     SeleniumLibrary.Wait Until Element Is Visible    ${loc_liste_formateur}
     SeleniumLibrary.click Element  ${loc_liste_formateur}
     SeleniumLibrary.Wait Until Page Contains    Formateurs

l'utilisateur clique sur le bouton d'édition sur la carte d'un formateur
     [Tags]    WEB
     SELENIUM.Sync Click    ${loc_first_formateur}

l'utilisateur est redirigé vers la page "modification d'un formateur"
     SeleniumLibrary.Wait Until Page Contains    Modification formateur


# GIVEN
l'utilisateur se trouve sur la page "modification d'un formateur" d'un des formateurs
     [Documentation]    L'utilisateur est connecté en tant qu'admin et sur la page "modification d'un formateur"
     [Tags]    WEB
     l'utilisateur se trouve sur la page "Formateurs"
     l'utilisateur clique sur le bouton d'édition sur la carte d'un formateur
     l'utilisateur est redirigé vers la page "modification d'un formateur"
#WHEN
l'utilisateur renseigne les champs "prénom" "nom" et "email" par les valeurs "test_prenom", "test_nom" et"test_email@sogeti.com"
    [Tags]    WEB
    SELENIUM.Sync Input Text    ${loc_prénom}     ${test_prenom}
    SELENIUM.Sync Input Text    ${loc_nom}    ${test_nom}
    SELENIUM.Sync Input Text    ${loc_email}     ${test_email}
    SeleniumLibrary.Click Button    ${loc_valider}
    SeleniumLibrary.Handle Alert  

#THEN
la fiche du formateur a été remplacée par les valeurs remplies
   SELENIUM.Sync Click    ${loc_liste_formateur}
    SELENIUM.Sync Click    ${loc_first_formateur}
   SeleniumLibrary.Element Should Contain    ${loc_prénom}     ${test_prenom}
   SeleniumLibrary.Element Should Contain    ${loc_nom}    ${test_nom}
   SeleniumLibrary.Element Should Contain    ${loc_email}    ${test_email}