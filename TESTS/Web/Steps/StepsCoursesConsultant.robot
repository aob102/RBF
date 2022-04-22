*** Settings ***
Library    SeleniumLibrary
Resource    ../POMs/Connexion.robot
Resource    ../POMs/Dashboard.robot
Resource    ../../../SOCLE/Libs/selenium.robot
*** Variables ***
@{list_courses}
...    Débutez la programmation avec Java
...    Concevez votre site web avec PHP et MySQL
...    Apprenez à programmer avec JavaScript
...    Apprenez à créer votre site web avec HTML5 et CSS3
...    Initiez-vous au marketing digital
...    Développez des applications Web avec Angular
...    Optimisez votre déploiement en créant des conteneurs avec Docker
...    Découvrez les métiers de développeur
...    UX design : découvrez les fondamentaux !
...    Découvrez l'univers de la cybersécurité
...    Managez une équipe au quotidien
...    Créez et appliquez une charte graphique
...    Découpez et intégrez une maquette
...    Concevez un contenu web accessible
...    Réalisez la maquette d’une application mobile avec Adobe XD
...    Découvrez les métiers des ressources humaines
...    Naviguez sur Internet
...    Devenez Mentor chez OpenClassrooms
...    Développez votre première application pour iOS
...    Fidélisez vos clients
...    Déployez vos systèmes et réseaux dans le cloud avec AWS
...    Devenez Mentor Evaluateur

*** Keywords ***
# Then 
l'utilisateur accède à la liste de ses cours attribués
    [Documentation]    Le consultant accède à la liste de ses cours
    FOR    ${course}    IN    @{list_courses}
        
        SeleniumLibrary.Wait Until Page Contains    ${course}
    END 