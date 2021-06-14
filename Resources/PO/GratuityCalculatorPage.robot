*** Settings ***
Documentation    This is the oject repository for gratuity calculator page
Library    SeleniumLibrary

*** Variables ***
${gratuityCalcPage} =   //h2[text()='Gratuity Calculator']
${radioIndicator} =     //input[@id='val1']
${inputSalary} =     id=salary
${inputYear} =       id=year
${inputMonth} =      id=month
${gratuityCalcBtn} =    //a[@id='graduity_calc_btn']
${resetBtn} =    id=reset_btn
${calculatedGratuity} =    //span[@id='graduity_amt']



*** Keywords ***
Validate Gratuity Calculator Page Loaded
    wait until page contains element    //h2[text()='Gratuity Calculator']
    element should contain    ${gratuityCalcPage}    Gratuity Calculator    ignore_case=True

Calculate The Gratuity After Entering The Details
    select radio button    q1    q1
    scroll element into view    ${gratuityCalcBtn}
    input text    ${inputSalary}    20000
    input text    ${inputYear}      7
    input text    ${inputMonth}     3
    click element    ${gratuityCalcBtn}
    [Return]    ${inputSalary}    ${inputYear}    ${inputMonth}


# calculate expected gratuity. Formula: (15*sal*year)/26 --> 7yrs 6mo = 7yrs & 7yr 7mo = 8yrs
    run keyword if    ${inputMonth} >= 6    roundUpYearGratuity
    ...    ELSE                             roundDownYearGratuity

roundUpYearGratuity
    ${durationYear}        evaluate    ${inputYear}+1
    ${expectedGratuity}    evaluate    ${inputSalary}*${durationYear}*15/26

    scroll element into view    ${calculatedGratuity}
    ${calculatedGratuity}   element should contain    ${expectedGratuity}

    click element    ${resetBtn}

roundDownYearGratuity
    ${durationYear}        evaluate    ${inputYear}
    ${expectedGratuity}    evaluate    ${inputSalary}*${durationYear}*15/26

    scroll element into view    ${calculatedGratuity}
    ${calculatedGratuity}   element should contain    ${expectedGratuity}

    click element    ${resetBtn}





