*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           String
Suite Setup       Open Browser To AliExpress
Suite Teardown    Close Browser

*** Variables ***
${URL}            https://www.aliexpress.com/
${SEARCH_TERM}    smart watch

*** Test Cases ***
Add Item To Cart
    Wait Random Time
    Input Search Term Human Like
    Wait Random Time
    Click Search Button
    Wait Until Page Contains Element           css=#card-list > div:nth-child(1) > div > div > a > div.jr_t > div.jr_ae > h3
    ${product_name}=    Get Text               css=#card-list > div:nth-child(1) > div > div > a > div.jr_t > div.jr_ae > h3
    Mouse Over                                 css=#card-list > div:nth-child(1) > div > div > a
    Scroll Element Into View                   css=#card-list > div:nth-child(1) > div > div > a
    Wait Random Time
    Click Element                              css=#card-list > div:nth-child(1) > div > div > a
    Switch Window                              NEW
    Wait Until Element Is Visible              css=button.add-to-cart--addtocart--Qhoji3M    timeout=15s
    Mouse Over                                 css=button.add-to-cart--addtocart--Qhoji3M
    Wait Random Time
    Click Button                               css=button.add-to-cart--addtocart--Qhoji3M

    # Check cart icon updates
    Wait Until Element Is Visible              css=div.shop-cart--text--i3avR3g > div > span
    ${cart_count}=    Execute JavaScript       return document.querySelector("div.shop-cart--text--i3avR3g > div > span").innerText;
    Run Keyword And Continue On Failure        Should Be Equal As Strings    ${cart_count}    1

    # Go to cart
    Wait Random Time
    Click Element                              css=a[href*="shoppingcart"]
    Run Keyword And Continue On Failure        Wait Until Page Contains             ${product_name}

*** Keywords ***
Open Browser To AliExpress
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Set Selenium Speed    0.3s
    Sleep    2s

Input Search Term Human Like
    Wait Until Element Is Visible    css=#search-words
    Clear Element Text               css=#search-words
    ${chars}=    Convert To List     ${SEARCH_TERM}
    FOR    ${char}    IN    @{chars}
        ${delay}=    Evaluate    __import__('random').uniform(0.05, 0.2)
        Sleep    ${delay}
        Press Keys    css=#search-words    ${char}
    END

Click Search Button
    Click Button    css=div.pc-header--search--3hnHLKw input.search--submit--2VTbd-T.search--newSubmit--3BlVRKw

Wait Random Time
    ${delay}=    Evaluate    __import__('random').uniform(1, 3)
    Sleep    ${delay}
