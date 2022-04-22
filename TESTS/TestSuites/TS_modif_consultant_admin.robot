*** Settings ***
Library    SeleniumLibrary
Resource    ../Web/POMs/Connexion.robot
Resource    ..//Web/POMs/Dashboard.robot
Resource    ..//Web/POMs/Consultants.robot
Resource    ../Data/Comptes.robot
Resource    ../Web/Steps/StepsConnexion.robot
Resource    ../Web/Steps/StepCreationConsultant.robot
Resource    ../Web/Steps/StepModificationConsultantParAdmin.robot
Resource    ../Web/Steps/StepsFormateurManager.robot
Resource    ../baseTest.robot
Test Setup    baseTest.Setup
#Test Teardown    baseTest.Teardown



Documentation    Tests sur la modification des informations d'un consultant par l'Admin
####################Redirection à la page "modification d'un consultant"######################################################

*** Test Cases ***
Redirection page modification d'un consultant
    [Tags]    WEB
    Given l'utilisateur est connecté en tant que admin
    And l'utilisateur se trouve sur la page "Consultants"
    When l'utilisateur appuie sur le bouton d'édition sur la carte d'un consultant    ConsultantPrénom ConsultantNom
    Then l'utilisateur est redirigé vers la page "modification d'un consultant"


Modification des informations du formulaire consultant par l'admin

    Given l'utilisateur se trouve sur la page "modification d'un consultant" d'un consultant
    When l'utilisateur remplace les champs d'information du consultant et clique sur Valider    Salimato    Diallo    abdelaziz.assoulaimani@sogeti.com    ManagerPrénom ManagerNom
    Then un message "Vous avez modifié le consultant" s'affiche
    And l'utilisateur est redirigé vers la page "consultants"
