*** Settings ***
Library    OperatingSystem
Library    Collections 
Library    String       


*** Variables ***
${loc_prénom}  //input[@name="firstName"]
${loc_nom}  //input[@name="lastName"]
${loc_email}  //input[@name="email"]
${loc_mdp}  //input[@name="password"]
${loc_valider}  //button[@class="button"]