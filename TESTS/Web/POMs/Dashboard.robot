*** Settings ***
Library    SeleniumLibrary
Documentation    Fichier contenant les éléments relatifs à la page de connexion


*** Variables ***
${loc_creer_MANAGER}   //a[@href="/managers/new"]
${loc_creer_formateur}   //a[@href="/trainers/new"]
${loc_cours}   //a[@href="/courses"]
${loc_cursus}   //a[@href="/cursus"]
${loc_consultants}   //a[@href="/consultants"]
${loc_Dashboard}    css=.message>img  
${loc_message}    //*[@id="root"]/div/main/div[1]
@{formateur_consultant_sections}    Dashboard    Cursus    Cours  
########### Admin ##################
@{admin_sections}    Dashboard    Cursus    Cours    Consultants    Formateurs
@{admin_cards}
...    Création d'un consultant
...    Création d'un formateur
...    Création d'un cursus
#...Not yet developped....
#...    Dashboard manager
#...    Création d'un manager
#...    Création d'un cours
#...    Création d'un Parcours   
${admin_card_count}    3
${loc_adminCard}    css=.link-card>div
${message_admin}     Vous êtes connecté en tant que admin
########### Manager ##################
${message_manager}     Vous êtes connecté en tant que manager
@{manager_sections}    Dashboard    Consultants    Cursus    Cours    
########### Formateur ##################
${message_formateur}     Vous êtes connecté en tant que formateur 
########### Consultant ##################
${message_consultant}     Vous êtes connecté en tant que consultant  
*** Keywords ***
Accéder_formulaire_formateur
      SeleniumLibrary.Wait Until Element Is Visible    ${loc_creer_formateur}
      SeleniumLibrary.click Element  ${loc_creer_formateur}
Accéder_liste_cours
    SeleniumLibrary.Wait Until Element Is Visible    ${loc_cours}
    SeleniumLibrary.click Element   ${loc_cours}
Accéder_liste_consultants
    SeleniumLibrary.Wait Until Element Is Visible    ${loc_consultants}
    SeleniumLibrary.click Element   ${loc_consultants}

Accéder_formulaire_Manager
    SeleniumLibrary.Wait Until Element Is Visible    ${loc_creer_MANAGER}
    SeleniumLibrary.click Element  ${loc_creer_MANAGER}
Accéder_liste_cursus
    SeleniumLibrary.Wait Until Element Is Visible    ${loc_cursus}
    SeleniumLibrary.click Element   ${loc_cursus}