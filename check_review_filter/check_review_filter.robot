*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Filter Element by 2 Star Rating and Verify 2 Star Reviews Rating
    Open Browser    https://www.trustedshops.de/bewertung/info_X77B11C1B8A5ABA16DDEC0C30E7996C21.html    chrome
    Click Element    class=sc-35f7948-0.giiFno
    Execute Javascript  window.scrollTo(0, document.querySelector('.sc-35f7948-0.giiFno').getBoundingClientRect().top + window.scrollY)
    Sleep  3s 
      Click Element    xpath=//label[@for='stars-value-2']
    Sleep  3s
    @{reviews}    Get WebElements    xpath://div[@class='review-entry__rating']/span[@class='star-rating__star star-rating__star--full']
    FOR    ${review}    IN    @{reviews}
        ${stars}    Get Element Attribute    ${review}@class
        Should Be True    '${stars}' == 'star-rating__star star-rating__star--full star-rating__star--2'
    END
    Close Browser
