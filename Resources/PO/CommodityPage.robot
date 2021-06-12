*** Settings ***
Documentation    This is the object repository for commodity page
Library    SeleniumLibrary

*** Variables ***
${commodityPageTxt} =       //ul[@class='bred_list']
${scrollToText} =       //h2[contains(text(),'Market Statistics')]
${goldCommodityLink} =  //li[@id='comm_tab1']//tr//td//a[contains(@href, 'commodity/gold-price.html')]

*** Keywords ***
#Assert page loaded
Validate The Commodity Page Loaded
    wait until element is visible    ${commodityPageTxt}
    element should contain    ${commodityPageTxt}     Commodities    ignore_case=True

Click On The Gold Commodity Link
    scroll element into view   ${scrollToText}
    click link   ${goldCommodityLink}
    sleep   1s
    @{tabList}    get window handles
    switch window    ${tabList}[1]
