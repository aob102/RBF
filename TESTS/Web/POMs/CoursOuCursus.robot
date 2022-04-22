*** Settings ***
Library    SeleniumLibrary
Library    String

Documentation    Contenant la liste des cours attribuable aux consultants


*** Variables ***
${loc_message_succes}   css=.message.success
${loc_liste_consultants}  //*[@class='modal-body']//li
${loc_boutonValider}   css= .modal-footer .button
${loc_boutonAttribuer}  //h3[text()='__TITLE__']/parent::div//button[text()='Attribuer']

*** Keywords ***
getButtonLocationByTitle
  [Arguments]  ${titre_cours}  
  [Return]  ${loc}
  ${loc}=  Replace String    ${loc_boutonAttribuer}    __TITLE__    ${titre_cours}

  
Attribuer_un_cours_cursus
    [Arguments]  ${titre_cours}
    ${loc_boutonAttribuerLocale}  getButtonLocationByTitle  ${titre_cours}
    SeleniumLibrary.Wait Until Element Is Visible     ${loc_boutonAttribuerLocale}
    SeleniumLibrary.Click Button     ${loc_boutonAttribuerLocale}
    

Verification_consultant

   [Arguments]  ${consultant_choisi}
   SeleniumLibrary.Wait Until Element Is Visible    ${loc_liste_consultants}
   SeleniumLibrary.Wait Until Element Is Visible  ${loc_boutonValider}
   #SeleniumLibrary.Click Element  ${loc_liste_consultants}
   ${liste_consultants}    SeleniumLibrary.Get WebElements     ${loc_liste_consultants}
    
  ${i}=  set variable   0
  FOR    ${element}    IN    @{liste_consultants}
    ${nom_prenom_Initials}    Get Text    ${element}
    ${nom_prenom}  Get Line    ${nom_prenom_Initials}    1
    
     
    ${test} =  Evaluate  $consultant_choisi==$nom_prenom  
    #Log To Console    ${test}
    IF  ${test}
        
        ${i}=   Evaluate    ${i} + ${1}
        ${element_consultant}   set variable    ${element}
        Set Global Variable    ${element_consultant}
    END
    
  END
  Log To Console    ${i}
  Should Be Equal As Integers    ${i}    ${1}   déja Attribué ou n'existe pas
Selectionner_consultant 
   
   SeleniumLibrary.Click Element    ${element_consultant}
   SeleniumLibrary.Click Button    ${loc_boutonValider}
   
Verfication_message_assigniation
  SeleniumLibrary.Wait Until Element Is Visible    ${loc_message_succes}
  Page Should Contain Element    ${loc_message_succes}
  Log To Console    assignition réussi
  