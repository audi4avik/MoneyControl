*** Settings ***
Documentation    This is the object repository for gold rate page
Library    SeleniumLibrary
Library    ExcelLibrary
Library    Collections

*** Variables ***
${pageHeading} =    //h1[text()='Gold Rate Today']
${dateTab} =    //a[contains(@id,'commodity_tab')]
${innerTab} =   //div[contains(@id,'commodity_innertab')]
${goldPriceTxt} =    //span[contains(@class,'_30')]
@{rowData} =

*** Keywords ***
Validate The Gold Rate Page Loaded
    wait until page contains element    ${pageHeading}
    element text should be    ${pageHeading}      Gold Rate Today

Write The Price Into Excel
    [Arguments]    ${excelFile}
    ${tabCount}    get element count    ${dateTab}
    ${tabCount}    evaluate    ${tabCount}+1

    FOR    ${index}    IN RANGE    1     ${tabCount}
           #retrieve details from each tab and put inside a list
           click element    (${dateTab})[${index}]
           ${tabTxt}       get text    (${dateTab})[${index}]
           ${goldPrice}    get text    (${innerTab})[${index}]${goldPriceTxt}

           ${changeval}
           append to list    @{rowData}     ${tabTxt}

           # write list data to excel
           open excel document    ${excelFile}   useTempDir=True
           write excel row     ${index}    ${currList}  row_offset=1    sheet_name=Gold Price
           save excel document    ${excelFile}
           close all excel documents
    END



