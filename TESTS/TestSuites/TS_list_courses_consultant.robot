*** Settings ***
Library    SeleniumLibrary
Resource    ../Web/POMs/Connexion.robot
Resource    ..//Web/POMs/Dashboard.robot
Resource    ../Data/Comptes.robot
Resource    ../Web/Steps/StepsConnexion.robot
Resource    ../Web/Steps/StepsCoursesConsultant.robot
Resource    ../baseTest.robot
Test Setup    baseTest.Setup
Test Teardown    baseTest.Teardown


Documentation    Liste des cours suivis par un consultant
####################
*** Test Cases ***
Liste de cours consultant
    [Documentation]    Liste des cours pour un consultant
    [Tags]    WEB
    Given l'utilisateur est sur la page de connexion
    When l'utilisateur renseigne les champs "Email" et "Mot de passe" avec les bonnes valeurs en tant que consultant
    Then l'utilisateur accède à la liste de ses cours attribués