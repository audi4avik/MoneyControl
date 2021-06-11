*** Settings ***
Documentation   elements for home page
Library    SeleniumLibrary

*** Variables ***
${loginLink} =     //a[@title='Hello, Login']
${modalLogin} =    //a[text()='Log-in']
${loginModal} =    //div[@class='modal-dialog']
${loginIframe} =   //iframe[@id='myframe']
${inputEmail} =    //form[@id='login_form']//input[@id='email']
${inputPwd} =      //form[@id='login_form']//input[@id='pwd']
${submitBtn} =     //button[@id='ACCT_LOGIN_SUBMIT']
${loggedUser} =    //ul[@class='log_list']//span[@class='usr_nm']
${logoutLink} =    //li[@class='alp login_user_logout']//a[@title='Logout']
${loginError} =    //form[@id='login_form']//div[@id='error_api']
${modalClose} =    //div[@class='modal-content']//button[@class='close']
${commodityLink} =    //ul[@class='clearfix main_nav']//a[@title='Commodities']
${commoditySection} =    //div[@class='comoCont clearfix MT20']
${currencyPageLink} =    //div[@class='bxcom']//a[@title='Currencies']


*** Keywords ***
Validate Home Page Loaded
    ${homePageUrl}   get location
    ${homePageUrl}   should be equal    https://www.moneycontrol.com/
    wait until page contains element    ${loginLink}

Go To Login Section
    click element    ${loginLink}
    wait until element is visible   ${modalLogin}
    click element    ${modalLogin}
    wait until element is visible    ${loginModal}
    set focus to element    ${loginModal}

Enter Login Credential
    [Arguments]    &{creds}
    select frame    ${loginIframe}
    wait until element is enabled    ${inputEmail}    timeout=10s
    input text   ${inputEmail}    ${creds.email}
    input password    ${inputPwd}   ${creds.paswrd}
    click element    ${submitBtn}

Validate Login Status
    [Arguments]    &{creds}
    sleep    5s
    ${loginVisible}    run keyword and return status    element should be visible    ${loggedUser}
    run keyword if      ${loginVisible} == True     Sucessful Login   # comparing values with quotes
    ...    ELSE                                     Failed Login      &{creds}

Sucessful Login
    [Arguments]
    ${userName}    get text     ${loggedUser}
    should contain    ${userName}   Avikdatta
    mouse over    ${loggedUser}
    click element    ${logoutLink}
    wait until page contains element    ${loginLink}
    

Failed Login
    [Arguments]    &{creds}
    ${errorTxt}    get text             ${loginError}
    should be equal      ${errorTxt}    ${creds.errorMsg}
    reload page


Click On Commodity Link From Navigation
    wait until page contains element    ${commodityLink}
    click element    ${commodityLink}

Go To Currency Section
    wait until page contains element    ${loginLink}
    scroll element into view    ${commoditySection}
    click element   ${currencyPageLink}
