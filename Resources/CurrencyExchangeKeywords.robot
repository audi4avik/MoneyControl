*** Settings ***
Documentation    Custom keywords for login tests
Resource    ./PO/HomePage.robot
Resource    ./PO/CurrencyPage.robot

*** Keywords ***
#High level keywords for currency exchange test cases
Find And Store The Currency Exchange Rates in Excel
    Go To Currency Exchange Page
    List The Currencies In Excel Sheet

#Low level keywords for currency exchange test cases
Go To Currency Exchange Page
    HomePage.Go To Currency Section

List The Currencies In Excel Sheet
    CurrencyPage.Retrieve The Currency Exchange Rate
    CurrencyPage.Sort The Exchange Rates In Descending Order
    CurrencyPage.Write The Rates To Excel Sheet
