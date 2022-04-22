*** Settings ***
Library    SeleniumLibrary
Resource    ../Data/Comptes.robot
Resource    ../Web/Steps/StepsModificationsFormateurParAdmin.robot
Resource    ../baseTest.robot
Test Setup    baseTest.Setup
#Test Teardown    baseTest.Teardown
*** Test Cases ***
Redirection du manager vers la page "modification d'un formateur"
    [Documentation]    Modification d'un formateur par admin
    [Tags]    WEB
    Given l'utilisateur est connecté avec le profil Admin
    And l'utilisateur se trouve sur la page "Formateurs"
    When l'utilisateur clique sur le bouton d'édition sur la carte d'un formateur
    Then l'utilisateur est redirigé vers la page "modification d'un formateur"

Modification des informations du formulaire formateur par l'admin
    [Documentation]    Modification d'un formateur par admin
    [Tags]    WEB
    Given l'utilisateur est connecté avec le profil Admin
    And l'utilisateur se trouve sur la page "modification d'un formateur" d'un des formateurs
    When l'utilisateur renseigne les champs "prénom" "nom" et "email" par les valeurs "test_prenom", "test_nom" et"test_email@sogeti.com"
    Then la fiche du formateur a été remplacée par les valeurs remplies 