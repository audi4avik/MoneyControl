*** Settings ***
Documentation    Custom keywords for login tests
Resource    ./PO/HomePage.robot

*** Keywords ***
#high level keywords
Navigate To Commodities Section And Capture The Gold Price
    Go To Commodities Section
    Capture The Gold Price In Excel Sheet

Go To Commodities Section
    HomePage.Click On Commodity Link From Navigation

Capture The Gold Price In Excel Sheet
    CommodityPage.Retrieve The Gold Price
    CommodityPage.Write The Price Into Excel


