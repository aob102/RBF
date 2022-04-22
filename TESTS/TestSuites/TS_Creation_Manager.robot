*** Settings ***
Library    SeleniumLibrary
Resource    ../Web/POMs/Cours.robot
Resource    ../Web/POMs/Connexion.robot
Resource    ..//Web/POMs/Dashboard.robot
Resource    ..//Web/POMs/NouveauManager.robot
Resource    ../Data/Comptes.robot
Resource    ../Web/Steps/StepsConnexion.robot
Resource    ../Web/Steps/StepsAttributionCours.robot
Resource    ../Web/Steps/StepsFormateurManager.robot
Resource    ../baseTest.robot
Test Setup    baseTest.Setup
Test Teardown    baseTest.Teardown
*** Test Cases ***
Création d'un manager avec succès par l'admin
    [Documentation]    créer un Manager par admin
    [Tags]    WEB
    Given l'utilisateur est connecté en tant que admin
    And l'utilisateur est sur la page formulaire "création d'un manager"
    When l'utilisateur renseigne les champs   prenom=tEST   nom=test  mail=toto55.titi@sogeti.com     mdp=123456
    And l'utilisateur clique sur le boutton valider  
   Then un message de succès est affiché " Vous avez créé un manager !
Création d'un formateur -cas non-passant email déjà utilisé
    [Documentation]    créer un Manager par admin non passant
    [Tags]    WEB
    Given l'utilisateur est connecté en tant que admin
    And l'utilisateur est sur la page formulaire "création d'un manager"
    When l'utilisateur renseigne les champs   prenom=ManagerPrénom   nom=ManagerNom  mail=saliejallow1@gmail.com     mdp=123456
    And l'utilisateur clique sur le boutton valider 
    Then un message de succès est affiché "Cet e-mail est déjà utilisé !"
