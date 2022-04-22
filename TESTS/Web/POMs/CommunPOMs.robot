*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Documentation    Contenant les éléments relatifs à la page de formulaire formateur
*** Variables ***

${loc_notif}  //button[@name='notif']
${loc_generique_element_not}        //em[contains(text(),'__element__')] 
${messageError}  notification du cursus inexistante
${loc_list_notif}  //ul[@class='notification-list']

*** Keywords ***
Remplir_formulaire
  [Arguments]  ${input_prénom}  ${input_nom}  ${input_email}  ${input_mdp}
  SeleniumLibrary.Wait Until Element Is Visible    ${loc_prénom}
  SeleniumLibrary.Input Text    ${loc_prénom}    ${input_prénom}
  SeleniumLibrary.Input Text    ${loc_nom}    ${input_nom}
  SeleniumLibrary.Input Text    ${loc_email}    ${input_email}
  SeleniumLibrary.Input Password    ${loc_mdp}    ${input_mdp}
valider la création 
  SeleniumLibrary.Click Button    ${loc_valider}
Verfication_creation
   [Arguments]  ${expectedMessage}
  ${message}  Handle Alert
  Should Be Equal As Strings    ${message}    ${expectedMessage}
Accéder_notification
  SeleniumLibrary.Wait Until Element Is Visible    ${loc_notif}
  SeleniumLibrary.Click Element    ${loc_notif}
Notification_Assignation
  [Arguments]  ${cursusAssigné}
   ${loc_message_notif}=  Replace String    ${loc_generique_element_not}   __element__    ${cursusAssigné} 
   SeleniumLibrary.Wait Until Element Is Visible    ${loc_list_notif}
   SeleniumLibrary.Page Should Contain Element    ${loc_message_notif}  ${messageError}
  