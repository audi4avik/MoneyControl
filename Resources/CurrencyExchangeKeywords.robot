*** Settings ***
Documentation    Custom keywords for login tests
Resource    ./PO/HomePage.robot
Resource    ./PO/CurrencyPage.robot

*** Keywords ***
#High level keywords for currency exchange test cases
Find And Store The Currency Exchange Rates in Excel
    [Arguments]    ${excelFile}
    Go To Currency Exchange Page
    List The Currencies In Excel Sheet      ${excelFile}

#Low level keywords for currency exchange test cases
Go To Currency Exchange Page
    HomePage.Validate The First Page Loaded
    HomePage.Go To Currency Section

List The Currencies In Excel Sheet
    [Arguments]    ${excelFile}
    CurrencyPage.Validate The Currency Exchange Page Loaded
    CurrencyPage.Retrieve The Currency Exchange Rate
    #CurrencyPage.Sort The Exchange Rates In Descending Order
    CurrencyPage.Write The Rates To Excel Sheet     ${excelFile}
