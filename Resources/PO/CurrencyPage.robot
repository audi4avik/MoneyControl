*** Settings ***
Documentation    This page holds the elements for currency page
Library    SeleniumLibrary
Library    ExcelLibrary
Library    Collections
Library    String
Library    OperatingSystem

*** Variables ***
${currencyConverter} =   css=h1.cc
${scrollElem} =          //a[text()='Currency Spot Rates']
${currencyHead} =        //div[@class='curdata']//table//td/strong
${conversionHead} =      //div[@class='curdata']//table//td[2][@class='bgylw']
@{currList} =
@{valueList} =
&{currDict} =

*** Keywords ***
Retrieve The Currency Exchange Rate
    wait until page contains element    ${currencyConverter}
    scroll element into view    ${scrollElem}
    ${currencyCount}    get element count    ${currencyHead}
    ${currencyCount}    evaluate    ${currencyCount}+1

    #loop through number of currency elements and get the names
    FOR    ${count}   IN RANGE    2    ${currencyCount}
           ${currencyName}    get text   (${currencyHead})[${count}]
           ${currencyName}    get substring  ${currencyName}   0   -2
           append to list     ${currList}       ${currencyName}
           ${currencyValue}   get text   (${conversionHead})[${count}]
           append to list     ${valueList}   ${currencyValue}
           #set to dictionary  ${currDict}    ${currencyName}   ${currencyValue}
    END
    [Return]    ${currList}    ${valueList}

# Sort The Exchange Rates In Descending Order

Write The Rates To Excel Sheet
    [Arguments]    ${excelFile}
    open excel document    ${excelFile}   useTempDir=True
    write excel column     1    ${currList}  row_offset=1    sheet_name=Currency
    write excel column     2    ${valueList}    row_offset=1    sheet_name=Currency
    save excel document    ${excelFile}
    close all excel documents