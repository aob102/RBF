*** Settings ***
Library    SeleniumLibrary
Resource    ../POMs/Connexion.robot
Resource    ../POMs/Dashboard.robot
Resource    ../../../SOCLE/Libs/KwLaunchCloseLogout.robot
#Resource    ../Web/Steps/StepsConnexion.robot




*** Keywords ***
# GIVEN
 l'utilisateur est sur la page de connexion
     [Documentation]    L'utilisateur accède à la page de connexion   
     KwLaunchCloseLogout.Kw_launch_browser    ${site_web}[url]     ${site_web}[title]

######################################## Tests profil consultant #####################################

# WHEN
l'utilisateur renseigne les champs "Email" et "Mot de passe" avec les bonnes valeurs en tant que consultant 
    [Documentation]    Connexion valide pour un consultant
    [Tags]    Critique    
    Connexion.Kw_Login    ${compte_consultant.userName}    ${compte_consultant.pwd}
    
    
# THEN
l'utilisateur est redirigé sur la page du Dashboard Consultant 
    SeleniumLibrary.Wait Until Page Contains Element    ${loc_Dashboard}
    SeleniumLibrary.Wait Until Element Contains    ${loc_message}    ${message_consultant}
    FOR    ${section}    IN    @{formateur_consultant_sections}
        SeleniumLibrary.Page Should Contain    ${section}
    END

    KwLaunchCloseLogout.Kw_LogOut

    


######################################## Tests profil manager #####################################


# WHEN

l'utilisateur renseigne les champs "Email" et "Mot de passe" avec les bonnes valeurs en tant que manager
    [Documentation]    Connexion valide pour un manager
    [Tags]    Critique    
    Connexion.Kw_Login    ${compte_manager.userName}    ${compte_manager.pwd}
    

# THEN
l'utilisateur est redirigé sur la page du Dashboard Manager
    SeleniumLibrary.Wait Until Page Contains Element    ${loc_Dashboard}
    SeleniumLibrary.Wait Until Element Contains    ${loc_message}    ${message_manager}
    FOR    ${section}    IN    @{manager_sections}
        SeleniumLibrary.Page Should Contain    ${section}
    END

    KwLaunchCloseLogout.Kw_LogOut

    


######################################## Tests profil formateur #####################################


# WHEN
l'utilisateur renseigne les champs "Email" et "Mot de passe" avec les bonnes valeurs en tant que formateur
    [Documentation]    Connexion valide pour un formateur
    [Tags]    Critique    
    Connexion.Kw_Login    ${compte_formateur.userName}    ${compte_formateur.pwd}

# THEN
l'utilisateur est redirigé sur la page du Dashboard formateur
    SeleniumLibrary.Wait Until Page Contains Element    ${loc_Dashboard}
    SeleniumLibrary.Wait Until Element Contains    ${loc_message}    ${message_formateur}
    FOR    ${section}    IN    @{formateur_consultant_sections}
        SeleniumLibrary.Page Should Contain    ${section}
    END
    KwLaunchCloseLogout.Kw_LogOut


######################################## Tests profil admin #####################################


# WHEN
l'utilisateur renseigne les champs "Email" et "Mot de passe" en tant que administrateur
    [Documentation]    Connexion valide pour un administrateur
    [Tags]    Critique    
    Connexion.Kw_Login    ${compte_admin.userName}    ${compte_admin.pwd}   
    

# THEN
l'utilisateur est redirigé sur la page du Dashboard Administrateur
    SeleniumLibrary.Wait Until Page Contains Element    ${loc_Dashboard}
    SeleniumLibrary.Wait Until Element Contains    ${loc_message}    ${message_admin}


    SeleniumLibrary.Wait Until Page Contains Element    ${loc_adminCard}
    ${card_count}=    SeleniumLibrary.Get Element Count    ${loc_adminCard}
    BuiltIn.Should Be True    ${card_count} >= ${admin_card_count}    
    FOR    ${card}    IN    @{admin_cards}
        SeleniumLibrary.Page Should Contain    ${card}
       
    END
    FOR    ${section}    IN    @{admin_sections}
        SeleniumLibrary.Page Should Contain    ${section}
    END
   KwLaunchCloseLogout.Kw_LogOut 




le message "Identifiant ou mot de passe incorrect" s'affiche sur la page
    Connexion.Kw_invalid_connection   ${loc_message_error}

# Cas non passant
l'utilisateur renseigne le champ "Email" avec le bon mot de passe et le champ "Mot de passe" avec une valeur érronée
    Connexion.Kw_Login    ${compte_manager.userName}     ${bad_pwd}
l'utilisateur renseigne le champ "Email" avec un mot de passe érroné et le champ "Mot de passe" avec une valeur correcte
    Connexion.Kw_Login    ${bad_userName}     ${compte_manager.pwd}
l'utilisateur renseigne les champs "Email" et "Mot de passe" avec des valeurs incorrectes
     Connexion.Kw_Login    ${bad_userName}     ${bad_pwd}



  
