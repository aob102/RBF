*** Settings ***
Library    OperatingSystem
Library    Collections 
Library    String       


*** Variables ***
&{compte_consultant}    userName=thibaud.navarre@sogeti.com    pwd=password    firstName=admin    lastName=admin
&{compte_admin}    userName=louis.brillet@sogeti.com    pwd=password    firstName=admin    lastName=admin
&{compte_manager}    userName=romain.henri@sogeti.com    pwd=password    firstName=admin    lastName=admin
&{compte_formateur}    userName=robin.collas@sogeti.com    pwd=password    firstName=admin    lastName=admin

${bad_userName}    badusername@something.fr
${bad_pwd}    badPaw123



