*** Settings ***
Documentation    Repo for the variables used

*** Variables ***
&{validLogin} =      email=audi4avik@gmail.com     paswrd=AudiR8V10$
&{invalidEmail} =    email=audi3avik@gmail.com     paswrd=AudiR8V10$    errorMsg=Invalid User Id/EmailID or Password. Please try again.
&{invalidPwd} =      email=audi4avik@gmail.com     paswrd=AudiR7V10$    errorMsg=Invalid User Id/EmailID or Password. Please try again.
&{incorrectEmail} =  email=audi4avikemail.com      paswrd=AudiR8V10$    errorMsg=Invalid User Id/EmailID or Password. Please try again.