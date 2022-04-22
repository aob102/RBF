*** Settings ***
Library    SeleniumLibrary

Library    String
Resource    ../../Data/Locators.robot


Documentation    Fichier Contenant les éléments relatifs à la page consultant

*** Variables ***


${loc_consultant}  //div[text()='__CONSULTANT__']
${loc_title}  //h3[text()='__TITLE__']
${loc_consult_edit_button}    //div[text()='__CONSULTANT__']/parent::*/button[@class='person-card-edit-button']

${loc_ongletConexion}   //a[@href='/consultants']



${loc_pageConsultant_name}    //h2 [@class='title large']
${consultantPage_name}    Consultants


${btn_AjouterConsultant}    css=.new-item-card

${nvConsultantPage_name}   Nouveau consultant
${loc_pageNvConsultant_name}    css=.title.large

${ModifConsultantPage_name}    Modification consultant
${loc_pageModifConsultant_name}    



${loc_consultantManager}    //select[@name='manager']
${loc_buttonSubmitCreaConsult}    //form[@autocomplete='off']/button[@class='button']
${loc_consult_manager}    //select[@name='manager']/option[(text()='__MANAGER__')]

${message_ConsulCree}    Vous avez créé un consultant !
${message_erreurEmail}    Cet e-mail est déjà utilisé !
${message_ChampManquant}    Veuillez renseigner ce champ.
${message_ConsulModifié}    Vous avez modifié le consultant !
${loc_listeConsultants}    //*[@id="root"]/div/main/ul/li








*** Keywords ***

getButtonLocationByName
  [Arguments]  ${nom_consultant}  
  [Return]  ${loc}
  ${loc}=  Replace String    ${loc_consultant}  __CONSULTANT__    ${nom_consultant} 

getTitleLocationByName
    [Arguments]  ${nom_cours}   
    [Return]  ${loc}
  ${loc}=  Replace String    ${loc_title}  __TITLE__    ${nom_cours}
  

getbuttonEditConsultantByName
     [Arguments]  ${nom_consultant}  
    [Return]  ${loc}
  ${loc}=  Replace String    ${loc_consult_edit_button}  __CONSULTANT__    ${nom_consultant} 


getConsultantManagerByName
     [Arguments]  ${nom_manager}  
    [Return]  ${loc}
  ${loc}=  Replace String    ${loc_consult_manager}  __MANAGER__    ${nom_manager} 


Kw_Champs_Creation_Consultant
    [Documentation]    Remplissage des informations pour la création d'un consultant
    ...    ${input_consultantFirstName} Prenom du consultant à créer
    ...    ${input_consultantName} Nom du consultant à créer
    ...    ${input_consultantEmail} Email du consultant à créer
    ...    ${input_consultantPassword} Password du consultant à créer
    [Arguments]    ${input_consultantFirstName}    ${input_consultantLastName}    ${input_consultantEmail}    ${input_consultantPassword}     

    SeleniumLibrary.Input Text    ${loc_prénom}    ${input_consultantFirstName}    
    SeleniumLibrary.Input Text    ${loc_nom}    ${input_consultantLastName}
    SeleniumLibrary.Input Text    ${loc_email}   ${input_consultantEmail}
    SeleniumLibrary.Input Text    ${loc_mdp}     ${input_consultantPassword}
    SeleniumLibrary.Click Button  ${loc_buttonSubmitCreaConsult}

afficher_page_consultant
  [Arguments]  ${nom_consultant} 
   ${nom_consultantLocale}  getButtonLocationByName  ${nom_consultant}
   SeleniumLibrary.Click Element    ${nom_consultantLocale} 
existence_cours
   [Arguments]  ${titre_cours} 
  ${titre_coursLocale}  getTitleLocationByName  ${titre_cours} 
  Element Should Be Visible    ${titre_coursLocale} 

Kw_Champs_Incomplet_Creation_Consultant
    [Documentation]    Remplissage des informations pour la création d'un consultant avec un champ manquant
    ...    ${input_consultantFirstName} Prenom du consultant à créer
    ...    ${input_consultantName} Nom du consultant à créer
    ...    ${input_consultantPassword} Password du consultant à créer
    [Arguments]    ${input_consultantFirstName}    ${input_consultantLastName}    ${input_consultantPassword}     

  

    SeleniumLibrary.Input Text    ${loc_prénom}    ${input_consultantFirstName}    
    SeleniumLibrary.Input Text    ${loc_nom}    ${input_consultantLastName}
    SeleniumLibrary.Input Text    ${loc_mdp}     ${input_consultantPassword}
    SeleniumLibrary.Click Button  ${loc_buttonSubmitCreaConsult}




Kw_Champs_Modification_consultant
    [Documentation]    Remplissage des informations pour la  modification des informations d'un consultant par l'admin
    ...    ${input_consultantFirstName} Prenom du consultant à créer
    ...    ${input_consultantName} Nom du consultant à créer
    ...    ${input_consultantEmail} Email du consultant à créer
    ...    ${input_consultantManager} Manager du consultant
    [Arguments]    ${input_consultantFirstName}    ${input_consultantLastName}    ${input_consultantEmail}    ${input_consultantManager} 

    SeleniumLibrary.Clear Element Text    ${loc_prénom}
    SeleniumLibrary.Input Text    ${loc_prénom}    ${input_consultantFirstName}

    SeleniumLibrary.Clear Element Text    ${loc_nom}
    SeleniumLibrary.Input Text    ${loc_nom}    ${input_consultantLastName}
    
    SeleniumLibrary.Clear Element Text    ${loc_email} 
    SeleniumLibrary.Input Text    ${loc_email}   ${input_consultantEmail}
    


    SeleniumLibrary.Click Element    ${loc_consultantManager}  
    ${newManager}    getConsultantManagerByName    ${input_consultantManager}
    SeleniumLibrary.Click Element    ${newManager}

    SeleniumLibrary.Click Button  ${loc_buttonSubmitCreaConsult}