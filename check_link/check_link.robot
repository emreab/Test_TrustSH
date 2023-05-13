*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Verify Wie berechnet sich die Note link
    Open Browser    https://www.trustedshops.de/bewertung/info_X77B11C1B8A5ABA16DDEC0C30E7996C21.html    chrome
    Click Link    Wie berechnet sich die Note?
    Wait Until Keyword Succeeds    5s    1s    Run Keyword And Return Status    Switch Window    NEW
    ${url}=    Get Location
    Should Contain    ${url}    https://www.trustedshops.de/bewertung/info_X77B11C1B8A5ABA16DDEC0C3
0E7996C21.html#faq
    Page Should Contain    Lesen Sie die Bewertungen anderer Kundinnen und Kunden von Jalousiescout.de als Orientierungshilfe!
    Close Window
    Close Browser
