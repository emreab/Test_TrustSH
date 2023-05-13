*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     BuiltIn

*** Test Cases ***
Extract Percentages and Sum Them
    Open Browser    https://www.trustedshops.de/bewertung/info_X77B11C1B8A5ABA16DDEC0C30E7996C21.html    chrome
    ${elements}    Get WebElements    xpath://div[@class="sc-61f2e426-8 iMXstX"]
    ${percentage_list}    Create List
    FOR    ${element}    IN    @{elements}
        ${text}    Get Text    ${element}
        ${percentage_text}    Set Variable    ${text.replace(' ', '').replace('\n', '')}
        ${percentage}    Set Variable    ${percentage_text.replace('%', '')}
        ${percentage}    Run Keyword If    '${percentage}' == '<1'    Convert To Number    0.5    ELSE    Convert To Number    ${percentage}
        Append To List    ${percentage_list}    ${percentage}
    END
    ${percentage_sum}    Evaluate    sum(${percentage_list})
    Log    The sum of the extracted percentages is ${percentage_sum}%
    Run Keyword If    ${percentage_sum} <= 100
    ...    Log    The sum is less than or equal to 100%
    ...    ELSE
    ...    Log    The sum is greater than 100%
    ...    AND    Fail    The sum is greater than 100%
    Close Browser
