*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Verify Page Title
    Open Browser    https://www.trustedshops.de/bewertung/info_X77B11C1B8A5ABA16DDEC0C30E7996C21.html    chrome
    ${title}    Get Title
    Run Keyword If    "${title}" != ""    Log    Title exists
    Run Keyword Unless    "${title}" != ""    Log    Title does not exist
    Close Browser
