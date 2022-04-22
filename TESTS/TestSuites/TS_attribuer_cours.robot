*** Settings ***
Library    SeleniumLibrary
Resource    ../Web/POMs/Cours.robot
Resource    ../Web/POMs/Connexion.robot
Resource    ..//Web/POMs/Dashboard.robot
Resource    ../Data/Comptes.robot
Resource    ../Web/Steps/StepsConnexion.robot
Resource    ../Web/Steps/StepsAttributionCours.robot
Resource    ../baseTest.robot
Test Setup    baseTest.Setup
Test Teardown    baseTest.Teardown
*** Test Cases ***
Assigniation de consultant
  [Tags]    WEB
  Given l'utilisateur est connecté en tant que manager
  And l'utilisateur a selectionné le cours  Passez au Full stack avec Node.js, Express et MongoDB
  And ce cours n'est pas attribué et sur la liste des consultants se trouve le nom du    ConsultantPrénom ConsultantNom
  When l'utilisateur sélectionne à ce consultant
  Then le message " consultant a bien été assigné au cours" s'affiche
  And le cours se trouve dans la liste des cours du consultant    ConsultantPrénom ConsultantNom 
  


  


