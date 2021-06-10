*** Settings ***
Documentation    This is the test case for login tests

Resource    ../Input/InputData.robot
Resource    ../Resources/Common.robot
Resource    ../Resources/LoginKeywords.robot

Test Setup       Common.Begin Test     ${browser}    ${baseUrl}
Test Teardown    Common.Begin Teardown

*** Test Cases ***
Test Login Scenarios
    [Documentation]    This is templated login scenarios
    [Tags]  login test
    [Template]  Validate Login Tests
    &{validLogin}
    &{invalidEmail}
    &{invalidPwd}
    &{incorrectEmail}

