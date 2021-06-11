*** Settings ***
Documentation    This is the object repository for gold rate page
Library    SeleniumLibrary
Library    ExcelLibrary
Library    Collections
Library    String

*** Variables ***
${pageHeading} =    //h1[@class='FL']
${dateTab} =        //a[contains(@id,'commodity_tab')]
${innerTab} =       //div[contains(@id,'commodity_innertab')]
${goldPriceTxt} =   //span[contains(@class,'_30')]
${priceChangeTxt} =    //div[contains(@id,'commodity_innertab')]//div[contains(@class,'PR20')]/strong
@{rowData} =

*** Keywords ***
Validate The Gold Rate Page Loaded
    execute javascript    window.scrollTo(document.body.scrollHeight, 0)
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
           ${changeVal}    get text    (${priceChangeTxt})[${index}]
           ${pre}	${post} =	Split String	${changeVal}

           append to list    ${rowData}     ${tabTxt}    ${goldPrice}    ${pre}	    ${post}

           # write list data to excel
#           open excel document    ${excelFile}   useTempDir=True
#           write excel row     ${index}    ${currList}  row_offset=1    sheet_name=Gold Price
#           save excel document    ${excelFile}
#           close all excel documents
    END



