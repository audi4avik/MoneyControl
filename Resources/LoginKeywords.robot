*** Settings ***
Documentation    Custom keywords for login tests
Resource    ./PO/HomePage.robot

*** Keywords ***
# High level keyword
Validate Login Tests
    [Arguments]    &{creds}
    Navigate To Login Page
    Attempt Login And Validate    &{creds}


# Low level keyword
Navigate To Login Page
    HomePage.Validate The Landing Page Loaded
    HomePage.Go To Login Section

Attempt Login And Validate
    [Arguments]    &{creds}
    HomePage.Enter Login Credential     &{creds}
    HomePage.Validate Login Status      &{creds}
