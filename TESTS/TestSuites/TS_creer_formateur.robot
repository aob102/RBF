*** Settings ***
Library    SeleniumLibrary
Resource    ../Web/POMs/Connexion.robot
Resource    ..//Web/POMs/Dashboard.robot
Resource    ..//Web/POMs/NouveauFormateur.robot
Resource    ../Data/Comptes.robot
Resource    ../Web/Steps/StepsConnexion.robot
Resource    ../Web/Steps/StepsFormateurManager.robot
Resource    ../baseTest.robot
Test Setup    baseTest.Setup
Test Teardown    baseTest.Teardown
*** Test Cases ***
Création d'un formateur -cas passant
    [Documentation]    créer un formateur par admin
    [Tags]    WEB
    Given l'utilisateur est connecté en tant que admin
    And l'utilisateur est sur la page formulaire "création d'un formateur"
    When l'utilisateur renseigne les champs   prenom=toto   nom=titi  mail=toto23.titi@sogeti.com     mdp=123456
    And l'utilisateur clique sur le boutton valider  
    Then un message de succès est affiché " Vous avez créé un formateur !
    
Création d'un formateur -cas non-passant email déjà utilisé
    [Documentation]    créer un formateur par admin
    [Tags]    WEB
    Given l'utilisateur est connecté en tant que admin
    And l'utilisateur est sur la page formulaire "création d'un formateur"
    When l'utilisateur renseigne les champs   prenom=FormateurPrénom   nom=FormateurNom  mail=salimatou.diallo@sogeti.com     mdp=123456
    And l'utilisateur clique sur le boutton valider  
    Then un message de succès est affiché "Cet e-mail est déjà utilisé !"


