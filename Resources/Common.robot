*** Settings ***
Documentation    This file holds the common resources
Library  SeleniumLibrary

*** Variables ***
${browser} =  chrome
${baseUrl} =  https://www.moneycontrol.com/

*** Keywords ***
Begin Test
    open browser  about:blank   ${browser}
    maximize browser window
    go to    ${baseUrl}

Begin Teardown
    close browser