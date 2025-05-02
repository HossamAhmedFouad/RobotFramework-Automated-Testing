*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           String
Suite Setup       Open Browser To AliExpress
Suite Teardown    Close Browser

*** Variables ***
${URL}            https://www.aliexpress.com/
${SEARCH_TERM}    smart watch
${SLEEP_TIME}     2s

*** Test Cases ***
Scenario One


Scenario Two


Scenario Three
    Go To    ${URL}
    Wait Constant Time
    Input Text    css=#search-words    ${SEARCH_TERM}
    Wait Constant Time
    Click Search Button
    Wait Constant Time
    Click Element                              css=#card-list > div:nth-child(1) > div > div > a
    Switch Window                              NEW

    Wait Constant Time
    Wait Until Element Is Visible              css=h1[data-pl="product-title"]    timeout=30s
    ${product_name}=    Get Text               css=h1[data-pl="product-title"]
    # Cart Click
    Wait Until Element Is Visible              css=button.add-to-cart--addtocart--Qhoji3M    timeout=15s
    Wait Constant Time
    Click Button                               css=button.add-to-cart--addtocart--Qhoji3M
    Wait Until Element Is Visible              css=div.shop-cart--text--i3avR3g > div > span
    ${cart_count}=    Execute JavaScript       return document.querySelector("div.shop-cart--text--i3avR3g > div > span").innerText;
    Run Keyword And Continue On Failure        Should Be Equal As Strings    ${cart_count}    1
    Wait Constant Time
    Click Element                              css=a[href*="shoppingcart"]
    Run Keyword And Continue On Failure        Wait Until Page Contains    ${product_name}


Scenario Four


Scenario Five


Scenario Six
    Go To    ${URL}
    Wait Constant Time
    Wait Until Page Contains Element           css=#_full_container_header_23_ > div.pc-header--right--2cV7LB8 > div > div.pc-header--items--tL_sfQ4 > div.es--wrap--RYjm1RT > div:nth-child(1) > div       timeout=30s
    Click Element                              css=#_full_container_header_23_ > div.pc-header--right--2cV7LB8 > div > div.pc-header--items--tL_sfQ4 > div.es--wrap--RYjm1RT > div:nth-child(1) > div
    Wait Constant Time
    Wait Until Page Contains Element           css=#_full_container_header_23_ > div.pc-header--right--2cV7LB8 > div > div.pc-header--items--tL_sfQ4 > div.es--wrap--RYjm1RT > div.es--contentWrap--ypzOXHr.es--visible--12ePDdG.es--rtl--2-LcjOR > div:nth-child(6) > div > div.select--text--1b85oDo       timeout=30s
    Click Element                              css=#_full_container_header_23_ > div.pc-header--right--2cV7LB8 > div > div.pc-header--items--tL_sfQ4 > div.es--wrap--RYjm1RT > div.es--contentWrap--ypzOXHr.es--visible--12ePDdG.es--rtl--2-LcjOR > div:nth-child(6) > div > div.select--text--1b85oDo
    Wait Constant Time
    Wait Until Page Contains Element           css=#_full_container_header_23_ > div.pc-header--right--2cV7LB8 > div > div.pc-header--items--tL_sfQ4 > div.es--wrap--RYjm1RT > div.es--contentWrap--ypzOXHr.es--visible--12ePDdG.es--rtl--2-LcjOR > div:nth-child(6) > div > div.select--popup--W2YwXWt.select--visiblePopup--VUtkTX2 > div:nth-child(2)       timeout=30s
    Click Element                              css=#_full_container_header_23_ > div.pc-header--right--2cV7LB8 > div > div.pc-header--items--tL_sfQ4 > div.es--wrap--RYjm1RT > div.es--contentWrap--ypzOXHr.es--visible--12ePDdG.es--rtl--2-LcjOR > div:nth-child(6) > div > div.select--popup--W2YwXWt.select--visiblePopup--VUtkTX2 > div:nth-child(2)
    Wait Constant Time
    Wait Until Page Contains Element           css=#_full_container_header_23_ > div.pc-header--right--2cV7LB8 > div > div.pc-header--items--tL_sfQ4 > div.es--wrap--RYjm1RT > div.es--contentWrap--ypzOXHr.es--visible--12ePDdG.es--rtl--2-LcjOR > div.es--saveBtn--w8EuBuy       timeout=30s
    Click Element                              css=#_full_container_header_23_ > div.pc-header--right--2cV7LB8 > div > div.pc-header--items--tL_sfQ4 > div.es--wrap--RYjm1RT > div.es--contentWrap--ypzOXHr.es--visible--12ePDdG.es--rtl--2-LcjOR > div.es--saveBtn--w8EuBuy
    Wait Constant Time
    ${discounted_prices}=    Get WebElements    css=span.iu_hs
    ${original_prices}=      Get WebElements    css=span.iu_ht

    FOR    ${el}    IN    @{discounted_prices}
        ${text}=    Get Text    ${el}
        Run Keyword If    '${text}' != ''    Run Keyword And Continue On Failure    Should Contain    ${text}    US
    END

    FOR    ${el}    IN    @{original_prices}
        ${text}=    Get Text    ${el}
        Run Keyword If    '${text}' != ''    Run Keyword And Continue On Failure    Should Contain    ${text}    US
    END


Scenario Seven


Scenario Eight



*** Keywords ***
Open Browser To AliExpress
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Set Selenium Speed    0.3s

Click Search Button
    Click Button    css=div.pc-header--search--3hnHLKw input.search--submit--2VTbd-T.search--newSubmit--3BlVRKw

Wait Constant Time
    Sleep    ${SLEEP_TIME}
