*** Settings ***
Documentation    This is the oject repository for gratuity calculator page
Library    SeleniumLibrary
Library    String

*** Variables ***
${gratuityCalcPage} =   //h2[text()='Gratuity Calculator']
${radioIndicator} =     //span[@class='rdbx openblock']
${inputSalary} =     id=salary
${inputYear} =       id=year
${inputMonth} =      id=month
${gratuityCalcBtn} =    //a[@id='graduity_calc_btn']
${resetBtn} =    id=reset_btn
${gratuityTxtLink} =    //span[@id='graduity_amt']


*** Keywords ***
Validate Gratuity Calculator Page Loaded
    wait until page contains element    //h2[text()='Gratuity Calculator']
    element should contain    ${gratuityCalcPage}    Gratuity Calculator    ignore_case=True

Calculate The Gratuity After Entering The Details
    [Arguments]    &{gratuityInput}
    scroll element into view    ${radioIndicator}
    click element    ${radioIndicator}
    scroll element into view    ${gratuityCalcBtn}
    input text    ${inputSalary}    ${gratuityInput.salary}
    input text    ${inputYear}      ${gratuityInput.year}
    input text    ${inputMonth}     ${gratuityInput.month}
    click element    ${gratuityCalcBtn}

    scroll element into view    ${gratuityTxtLink}
    ${calculatedGratuity}    get text    ${gratuityTxtLink}
    ${calculatedGratuity}    remove string    ${calculatedGratuity}    ,

    [Return]    ${calculatedGratuity}


# calculate expected gratuity. Formula: (15*sal*year)/26 --> 7yrs 6mo = 7yrs & 7yr 7mo = 8yrs
    run keyword if    ${gratuityInput.month} >= 6    roundUpYearGratuity     ${gratuityInput}    ${calculatedGratuity}
    ...    ELSE                                      roundDownYearGratuity   ${gratuityInput}    ${calculatedGratuity}

roundUpYearGratuity
    [Arguments]    ${gratuityInput}    ${calculatedGratuity}
    ${gratuityInput.year}  evaluate    ${gratuityInput.year}+1
    ${gratuity}    evaluate    ${gratuityInput.salary}*${gratuityInput.year}*15/26
    ${gratuityStr}    convert to string    ${gratuity}
    @{expectedGratuity}    split string     ${gratuityStr}   .

    should contain   ${calculatedGratuity}     ${expectedGratuity}[0]

    click element    ${resetBtn}

roundDownYearGratuity
    [Arguments]    ${gratuityInput}    ${calculatedGratuity}
    ${gratuity}    evaluate    ${gratuityInput.salary}*${gratuityInput.year}*15/26
    ${gratuityStr}    convert to string    ${gratuity}
    @{expectedGratuity}    split string     ${gratuityStr}   .

    should contain    ${calculatedGratuity}     ${expectedGratuity}[0]

    click element    ${resetBtn}





