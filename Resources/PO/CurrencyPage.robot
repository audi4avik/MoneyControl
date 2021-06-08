*** Settings ***
Documentation    This page holds the elements for currency page
Library    SeleniumLibrary
Library    ExcelLibrary
Library    Collections
Library    String

Resource    ../../Input/InputData.robot

*** Variables ***
${currencyConverter} =   css=h1.cc
${scrollElem} =          //a[text()='Currency Spot Rates']
${currencyHead} =        //div[@class='curdata']//table//td/strong
${conversionHead} =     //div[@class='curdata']//table//td[2][@class='bgylw']
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
           ${currencyValue}   get text   (${conversionHead})[${count}]
           set to dictionary   ${currDict}   ${currencyName}    ${currencyValue}
    END


Sort The Exchange Rates In Descending Order




Write The Rates To Excel Sheet
    # ExcelLibrary - Open, Read, Write & Close
    open excel document    ${excelPath}    useTempDir=True
    write excel column     5    ${idList}    row_offset=1    sheet_name=PUT-Operation
    save excel document    ${excelPath}
    close current excel document