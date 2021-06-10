*** Settings ***
Documentation    This file holds the common resources
Library  SeleniumLibrary

*** Keywords ***
Begin Test
    [Arguments]    ${browser}   ${baseUrl}
    open browser  about:blank   ${browser}
    maximize browser window
    go to    ${baseUrl}

Begin Teardown
    close browser