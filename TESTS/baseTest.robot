*** Settings ***
Resource    ../SOCLE/baseSocle.robot
Resource    Env/ENV_DEFAULT.robot
Resource    Data/DATA_DEFAULT.robot
*** Keywords ***
Setup
    BuiltIn.Import Resource    ${CURDIR}/Env/ENV_${ENV}.robot 
    BuiltIn.Import Resource    ${CURDIR}/Data/DATA_${ENV}.robot 
    baseSocle.Test Setup
    
Teardown
    baseSocle.Test Teardown