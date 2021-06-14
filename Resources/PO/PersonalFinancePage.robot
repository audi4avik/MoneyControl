*** Settings ***
Documentation    This is the object repository for calcutaor tools page
Library    SeleniumLibrary


*** Variables ***
${personalFinancePageTxt} =   //ul[@class='bred_list']//li//h1[contains(text(),'Personal Finance')]
${personalFinancePageURL} =      https://www.moneycontrol.com/personal-finance/
${personalFinanceSection} =   //h2/a[text()='Personal Finance Tools']
${gratuityCalculator} =       //div[@class='personal_fintoolbx']//a[@title='Gratuity Calculator']


*** Keywords ***
Validate The Personal Finance Page Loaded
    wait until page contains element    ${personalFinancePageTxt}
    ${personalFinanceURL}    get location
    should be equal   ${personalFinanceURL}     ${personalFinancePageURL}    ignore_case=True

Locate The Gratuity Calculator Tool
    scroll element into view    ${gratuityCalculator}
    element should contain      ${personalFinanceSection}    Personal Finance Tools    ignore_case=True
    click element    ${gratuityCalculator}



