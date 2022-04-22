*** Settings ***
Library    SeleniumLibrary
Resource    ../Web/POMs/Connexion.robot
Resource    ../Web/Steps/StepsAttributionCours.robot
Resource    ../Web/Steps/StepsCursus.robot
Resource    ../baseTest.robot
Test Setup    baseTest.Setup
Test Teardown    baseTest.Teardown
*** Test Cases ***
Assigniation de cursus
  [Tags]    WEB
  Given l'utilisateur est connecté en tant que manager
  And l'utilisateur a selectionne le cursus  CursusTest2
  And ce cursus n'est pas attribué et la liste des consultants contient  Billal Hatoum
  When l'utilisateur sélectionne le cursus à ce consultant
  Then le message "1 consultant a bien été assigné au cursus" s'affiche
  And le consultant reçoit une notification