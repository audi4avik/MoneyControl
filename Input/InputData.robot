*** Settings ***
Documentation    Repo for the variables used

*** Variables ***
${browser} =  chrome
${baseUrl} =  https://www.moneycontrol.com/
&{validLogin} =      email=audi4avik@gmail.com     paswrd=AudiR8V10$
&{invalidEmail} =    email=audi3avik@gmail.com     paswrd=AudiR8V10$    errorMsg=Invalid User Id/EmailID or Password. Please try again.
&{invalidPwd} =      email=audi4avik@gmail.com     paswrd=AudiR7V10$    errorMsg=Invalid User Id/EmailID or Password. Please try again.
&{incorrectEmail} =  email=audi4avikemail.com      paswrd=AudiR8V10$    errorMsg=Invalid User Id/EmailID or Password. Please try again.

${excelFile} =    ./Output/TestResult.xlsx

&{gratuityInput} =    salary=20000    year=7    month=7