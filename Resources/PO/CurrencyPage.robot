*** Settings ***
Documentation    This page holds the elements for currency page
Library    SeleniumLibrary

*** Variables ***
${currencyConverter} =    css=h1.cc

*** Keywords ***
Retrieve The Currency Exchange Rate

Sort The Exchange Rates In Descending Order

Write The Rates To Excel Sheet