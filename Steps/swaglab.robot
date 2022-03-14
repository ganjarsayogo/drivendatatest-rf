*** Settings ***
Library             SeleniumLibrary
Library             DataDriver         ../Resources/credentials.csv    sheet_name=Sheet1
Suite Setup         Open Browser        ${webURL}           ${BROWSERS}
Suite Teardown      Close Browser
Test Template       I Login with invalid username and invalid password

*** Variables ***
${webURL}           https://saucedemo.com/
${BROWSERS}         chrome

*** Keywords ***
I Login with invalid username and invalid password
    Maximize Browser Window
    [Arguments]         ${username}                         ${password}
    Input Text          //input[@id="user-name"]            ${username}
    Input Text          //input[@id="password"]             ${password}
    Click Element       //input[@id="login-button"]
    Page Should Contain                                     Epic sadface: Username and password do not match any user in this service

***Test Cases***
Login with invalid username and invalid password using CSV File     ${username}     ${password}