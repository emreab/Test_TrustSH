*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Verify Number is Visible and Above Zero
    Open Browser    https://www.trustedshops.de/bewertung/info_X77B11C1B8A5ABA16DDEC0C30E7996C21.html    chrome
    Wait Until Element Is Visible    css=.sc-3a77ab16-6.kohtTt
    ${number}    Get Text    css=.sc-3a77ab16-6.kohtTt
    Run Keyword If    ${number} > 0    Log    Number ${number} is visible and above zero
    Close Browser
