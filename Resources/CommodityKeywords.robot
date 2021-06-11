*** Settings ***
Documentation    Custom keywords for login tests
Resource    ./PO/HomePage.robot
Resource    ./PO/CommodityPage.robot
Resource    ./PO/GoldRatePage.robot

*** Keywords ***
#high level keywords
Navigate To Commodities Section And Capture The Gold Price
    [Arguments]     ${excelFile}
    Go To Commodities Section
    Move to The Gold Price Details Section
    Capture Gold Rate Details In Excel Sheet    ${excelFile}

Go To Commodities Section
    HomePage.Validate Home Page Loaded
    HomePage.Click On Commodity Link From Navigation

Move to The Gold Price Details Section
    CommodityPage.Validate The Commodity Page Loaded
    CommodityPage.Click On The Gold Commodity Link

Capture Gold Rate Details In Excel Sheet
    [Arguments]    ${excelFile}
    GoldRatePage.Validate The Gold Rate Page Loaded
    GoldRatePage.Write The Price Into Excel     ${excelFile}


