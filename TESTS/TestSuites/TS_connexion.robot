*** Settings ***
Library    SeleniumLibrary
Resource    ../Web/POMs/Connexion.robot
Resource    ..//Web/POMs/Dashboard.robot
Resource    ../Data/Comptes.robot
Resource    ../Web/Steps/StepsConnexion.robot
Resource    ../baseTest.robot
Test Setup    baseTest.Setup
Test Teardown    baseTest.Teardown

Documentation    Test sur toutes les actions de la page de connexion pour tous les rôles.
####################
*** Test Cases ***
 ################################################Cas passant######################################################
Connexion en tant que consultant
    [Documentation]    connexion en OK en tant que consultant
    [Tags]    WEB
    Given l'utilisateur est sur la page de connexion
    When l'utilisateur renseigne les champs "Email" et "Mot de passe" avec les bonnes valeurs en tant que consultant 
    Then l'utilisateur est redirigé sur la page du Dashboard Consultant

Connexion en tant que manager
    [Documentation]    connexion en OK en tant que manager
    [Tags]    WEB
    Given l'utilisateur est sur la page de connexion
    l'utilisateur renseigne les champs "Email" et "Mot de passe" avec les bonnes valeurs en tant que manager
    Then l'utilisateur est redirigé sur la page du Dashboard Manager


Connexion en tant que formateur
    [Documentation]    connexion en OK en tant que formateur
    [Tags]    WEB
    Given l'utilisateur est sur la page de connexion
    When l'utilisateur renseigne les champs "Email" et "Mot de passe" avec les bonnes valeurs en tant que formateur
    Then l'utilisateur est redirigé sur la page du Dashboard formateur
Connexion en tant que administrateur
    [Documentation]    connexion en OK en tant que administrateur
    [Tags]    WEB
    Given l'utilisateur est sur la page de connexion
    When l'utilisateur renseigne les champs "Email" et "Mot de passe" en tant que administrateur
    Then l'utilisateur est redirigé sur la page du Dashboard Administrateur
   

#############################################Cas non passant######################################################

Connexion KO avec un bon mot de passe et un émail érroné
    [Documentation]    Connexion invalide avec un mauvais émail et un bon mot de passe 
    [Tags]    WEB
    Given l'utilisateur est sur la page de connexion    
    When l'utilisateur renseigne le champ "Email" avec un mot de passe érroné et le champ "Mot de passe" avec une valeur correcte
    Then le message "Identifiant ou mot de passe incorrect" s'affiche sur la page

Connexion KO avec un bon émail et un mot de passe érroné
    [Documentation]    Connexion invalide avec un bon émail et un mauvais mot de passe 
    [Tags]    WEB
    Given l'utilisateur est sur la page de connexion 
    When l'utilisateur renseigne le champ "Email" avec le bon mot de passe et le champ "Mot de passe" avec une valeur érronée
    Then le message "Identifiant ou mot de passe incorrect" s'affiche sur la page
Connexion KO avec un émail et mot de passe érronés 
    [Documentation]    Connexion invalide avec un émail et mot de passe érronés 
    [Tags]    WEB
    Given l'utilisateur est sur la page de connexion
    When l'utilisateur renseigne les champs "Email" et "Mot de passe" avec des valeurs incorrectes
    Then le message "Identifiant ou mot de passe incorrect" s'affiche sur la page

        
      