*** Settings ***
Documentation    Keywords page for all calculator tools under moneycontrol website
Resource    ./PO/HomePage.robot
Resource    ./PO/PersonalFinancePage.robot
Resource    ./PO/GratuityCalculatorPage.robot

*** Keywords ***
Find The Tool And Calculate The Gratutiy
    Go To Personal Finance Page
    Calculate The Gratuity After Locating The Tool

Go To Personal Finance Page
    HomePage.Validate The Landing Page Loaded
    HomePage.Click On Personal Finance From Navigation

Calculate The Gratuity After Locating The Tool
    PersonalFinancePage.Validate The Personal Finance Page Loaded
    PersonalFinancePage.Locate The Gratuity Calculator Tool
    GratuityCalculatorPage.Validate Gratuity Calculator Page Loaded
    GratuityCalculatorPage.Calculate The Gratuity After Entering The Details