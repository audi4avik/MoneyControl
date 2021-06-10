*** Settings ***
Documentation    These are the test cases for E2E workflow
Resource    ../Input/InputData.robot
Resource    ../Resources/Common.robot
Resource    ../Resources/CurrencyExchangeKeywords.robot

Test Setup       Common.Begin Test     ${browser}    ${baseUrl}
Test Teardown    Common.Begin Teardown

*** Test Cases ***
#Validate The Gold Commodity Price
#    [Documentation]    Check the gold price over different period

Validate The Currencies With Top Exchange Rate
    [Documentation]    Store currencies with top 3 exchange rates
    [Tags]  currency exchange
    CurrencyExchangeKeywords.Find And Store The Currency Exchange Rates in Excel    ${excelFile}


