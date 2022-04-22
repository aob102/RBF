*** Settings ***
Resource    Libs/selenium.robot 
Library    SeleniumLibrary
Resource    ../TESTS/Web/POMs/Connexion.robot
Resource    Libs/KwLaunchCloseLogout.robot
#Resource    Application.robot
*** Variables ***
# Variable pouvant être modifié par le run configuration 
# exemple --variable ENV:DEFAULT
${ENV}    DEFAULT
@{PLATFORM_ALLOWED}    CHROME    FIREFOX    CUSTOM_CHROME    REMOTE_CHROME    
${PLATFORM}    CHROME
${loc_mainMenu}    css=.header-button[name='user']
${loc_logOut}    css=.user-menu-btn.logout-btn
*** Keywords ***
Suite Setup
    BuiltIn.Log To Console    START SUITE   
    BuiltIn.Log To Console    CURDIR=${CURDIR}
    BuiltIn.Log To Console    EXECDIR=${EXECDIR}
    BuiltIn.Log To Console    OUTPUT DIR=${OUTPUT DIR}
    BuiltIn.Log To Console    ENV=${ENV}
    BuiltIn.Log To Console    WEB-PLATFORM=${PLATFORM}
    BuiltIn.Run Keyword If    '''${PLATFORM}''' not in '''${PLATFORM_ALLOWED}'''    BuiltIn.Fail    PLATFORM_NOT_ALLOWED 

Suite Teardown
    BuiltIn.Log To Console    END SUITE

Test Setup
    BuiltIn.Log To Console    ${EMPTY}
    BuiltIn.Log To Console    START TEST    
    # Pour les tests WEB ouvrir le navigateur sur les tests qui ont un TAG WEB   
    ${isTestWEB}    BuiltIn.Evaluate    """WEB""" in """${TEST TAGS}"""
    BuiltIn.Run Keyword If    ${isTestWEB}    BuiltIn.Run Keyword    SELENIUM.Open ${PLATFORM}
    BuiltIn.Run Keyword If    ${isTestWEB}    BuiltIn.Run Keyword    SELENIUM.Init Conf
    

Test Teardown
    BuiltIn.Log To Console    fwk_test_teardown
    # Pour les tests WEB faire une capture d ecran et capture du source html en cas de failed
    # Pour les tests WEB fermer le navigateur 
    ${isTestWEB}    BuiltIn.Evaluate    """WEB""" in """${TEST TAGS}"""    
    BuiltIn.Run Keyword If    ${isTestWEB}    BuiltIn.Run Keyword If Test Failed    SELENIUM.Capture Step ScreenShot    ERROR
    BuiltIn.Run Keyword If    ${isTestWEB}    BuiltIn.Run Keyword If Test Failed    SELENIUM.Capture Step Html Source    ERROR
    BuiltIn.Run Keyword If    ${isTestWEB}    BuiltIn.Run Keyword    SELENIUM.Close Browsers
    Kw_close_all_browsers


    