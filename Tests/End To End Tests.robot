*** Settings ***
Documentation    These are the test cases for E2E workflow
Resource    ../Input/InputData.robot
Resource    ../Resources/Common.robot
Resource    ../Resources/CurrencyExchangeKeywords.robot
Resource    ../Resources/CommodityKeywords.robot

Test Setup       Common.Begin Test     ${browser}    ${baseUrl}
Test Teardown    Common.Begin Teardown

#TODO - Add workflow logic for skip landing page
#TODO - Add OS validation for excel files present in the dir
#TODO - Add gold price change per day in a new row

*** Test Cases ***
Validate The Gold Commodity Price
    [Documentation]    Check the gold price over different period
    [Tags]    gold
    CommodityKeywords.Navigate To Commodities Section And Capture The Gold Price    ${excelFile}


Validate The Currencies With Top Exchange Rate
    [Documentation]    Store currencies with top 3 exchange rates
    [Tags]  currency
    CurrencyExchangeKeywords.Find And Store The Currency Exchange Rates in Excel    ${excelFile}


