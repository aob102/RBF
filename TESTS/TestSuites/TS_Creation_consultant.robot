*** Settings ***
Library    SeleniumLibrary
Resource    ../Web/POMs/Connexion.robot
Resource    ..//Web/POMs/Dashboard.robot
Resource    ..//Web/POMs/Consultants.robot
Resource    ../Data/Comptes.robot
Resource    ../Web/Steps/StepsConnexion.robot
Resource    ../Web/Steps/StepCreationConsultant.robot
Resource    ../baseTest.robot
Test Setup    baseTest.Setup
#Test Teardown    baseTest.Teardown


Documentation    Tests sur la création d'un consultant par le manager
####################Redirection à la page "nouveau consultant"######################################################

*** Test Cases ***
Accéder à la page consultant depuis le dashboard   
    [Documentation]  Acceder à la page consultant
    [Tags]    WEB
    Given l'utilisateur connecté est de profil manager
    When l'utilisateur clique sur l'onglet "Consultants"
    Then l'utilisateur est redirigé vers la page "consultants"


Redirection formulaire création d'un consultant   
   [Documentation]  Acceder à la pag création d'un consultant
   [Tags]    WEB
    Given L'utilisateur se trouve sur la page "consultant"
    When l'utilisateur Clique sur le bouton "Ajouter un consultant"
    Then Il est redirigé sur la page "Nouveau consultant"


creation d'un consultant (manager) - Cas passant OK
    [Documentation]  Créer un consultant
    [Tags]    WEB
    Given L'utilisateur se trouve sur la page "Création d'un consultant"
    When L'utilisateur remplit les champs d'information pour la création d'un consultant    Prenom    Nom    Email@fmail.com    password
    Then Une pop up avec le message Vous avez créé un consultant ! s'affiche
    And l'utilisateur est redirigé vers la page "consultants"
    
    

creation d'un consultant - cas non passant - email doublon
    [Documentation]  Créer un consultant avec un email qui existe deja
    [Tags]    WEB
    Given L'utilisateur se trouve sur la page "Création d'un consultant"    
    When L'utilisateur remplit les champs d'information pour la création d'un consultant    Thibaud    Navarre    thibaud.navarre@Sogeti.com    password
    Then Une pop up avec le message 'Cet e-mail est déjà utilisé ! s'affiche

creation d'un consultant - cas non passant - champs manquant
    [Documentation]  Ne pas remplir tous les champs de la création d'un consultant
    [Tags]    WEB
    Given L'utilisateur se trouve sur la page "Création d'un consultant"    
    When L'utilisateur ne remplit pas tous les champs d'information pour la création d'un consultant     Prenom    Nom    password
    Then l'utilisateur n'est pas redirigé vers la page "Consultants"

creation d'un consultant - cas non passant 2 - mauvais format email
    [Documentation]  Remplir les champs avec un mauvais format email
    [Tags]    WEB
    Given L'utilisateur se trouve sur la page "Création d'un consultant"    
    When L'utilisateur remplit les champs d'information pour la création d'un consultant    Prenom    Nom     Email    password 
    Then l'utilisateur n'est pas redirigé vers la page "Consultants"