*** Settings ***
Library    SeleniumLibrary
Resource    ../../Data/Locators.robot
Documentation    Contenant les éléments relatifs à la page de connexion


*** Variables ***
${invalidPwd}    Le mot de passe est invalide
${undefinUser}    L'utilisateur n'existe pas
${page_name}    Tipoca - Login

#${loc_userName}    //input[@type='email']
#${loc_pwd}    //input[@type='password']
${loc_btnConnexion}    //button[contains(.,'Se connecter')]
${loc_forgetPwd}      css=.forgot-pwd-link
#${loc_mail}    //input[@type='email']
${loc_message_error}    css=.message.error



*** Keywords ***
Kw_Login
    [Documentation]    Connexion à l'application
    ...    ${input_userName} Username de l'utilisateur
    ...    ${input_pwd} Mot de passe de l'utilisateur
    [Arguments]    ${input_userName}    ${input_pwd}
    Kw_load_login_page
    SeleniumLibrary.Input Text    ${loc_email}    ${input_userName}    
    SeleniumLibrary.Input Password    ${loc_mdp}    ${input_pwd}
    SeleniumLibrary.Click Button    ${loc_btnConnexion}




Kw_load_login_page
    [Documentation]    Vérifie que les éléments de la pages de connexion sont bien présents   
    SeleniumLibrary.Wait Until Element Is Visible    ${loc_email} 
    SeleniumLibrary.Wait Until Element Is Visible    ${loc_mdp}
   # SeleniumLibrary.Wait Until Element Is Visible    ${loc_bg}
    SeleniumLibrary.Wait Until Element Is Visible    ${loc_forgetPwd}
    #SeleniumLibrary.Wait Until Element Is Visible    ${loc_cgu}
    SeleniumLibrary.Wait Until Element Is Visible    ${loc_btnConnexion}  

Kw_invalid_connection
    [Documentation]
    ...    Vérifie que la connexion n'a pas aboutie. On reste sur la page de connexion
    [Arguments]    ${elmt}   
    Kw_load_login_page
    SeleniumLibrary.Wait Until Element Is Visible    ${elmt}    
    
