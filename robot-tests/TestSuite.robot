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
@{passwords}      xxxxx
@{emails}         naddaa26@gmail.com


*** Test Cases ***
Scenario One


Scenario Two


Scenario Three
    Go To    ${URL}
    Reset Browser State
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
    Go To                            ${URL}
    Reset Browser State
    Close Popup
    Wait Until Element Is Visible    xpath=//*[@id="_full_container_header_23_"]/div[2]/div/div[2]/div[2]/div/div
    Click Element                    xpath=//*[@id="_full_container_header_23_"]/div[2]/div/div[2]/div[2]/div/div
    Sleep                            1s
    Click Element                    xpath=//*[@id="_full_container_header_23_"]/div[2]/div/div[2]/div[2]/div[2]/div[4]/div/div[1]/div
    Sleep                            1s
    Click Element                    xpath=//*[@id="_full_container_header_23_"]/div[2]/div/div[2]/div[2]/div[2]/div[4]/div/div[2]/div[2]
    Sleep                            1s
    Click Element                    xpath=//div[@class='es--saveBtn--w8EuBuy']
    Sleep                            4s
    Element Text Should Be           xpath=//span[@class='ship-to--small--1wG1oGl'] \ \ \                                                       EN/
    Sleep                            1s

Scenario Five
    Reset Browser State
    ${email}                         Set Variable                                                                                               ${emails}[0]
    Mouse Over                       xpath=//*[@id="_full_container_header_23_"]/div[2]/div/div[2]/div[3]
    Click Element                    xpath=//button[contains(@class, 'my-account--signin--')]
    Input Text                       xpath=//*[@id="batman-dialog-wrap"]/div/div/div/div[1]/div/div[3]/div[2]/div/span/span[1]/span[1]/input    ${email}
    Sleep                            1s
    Press Keys                       xpath=//*[@id="batman-dialog-wrap"]/div/div/div/div[1]/div/div[3]/div[2]/div/span/span[1]/span[1]/input    ENTER
    Wait Until Element Is Visible    xpath=//*[@id="fm-login-password"]
    Input Password                   xpath=//*[@id="fm-login-password"]                                                                         ${passwords}[0]
    Sleep                            2s
    Click Element                    xpath=//*[@id="batman-dialog-wrap"]/div/div/div/div[1]/div[9]/button
    Log                              Please solve the CAPTCHA manually within 15 seconds
    Sleep                            15s
    ${username}                      Evaluate                                                                                                   "${email.split('@')[0]}"
    Mouse Over                       xpath=//*[@id="_full_container_header_23_"]/div[2]/div/div[2]/div[3]
    Sleep                            2s
    ${header_text}                   Get Text                                                                                                   xpath=//div[@class='my-account--textCenter--2K0hniX']//p
    Should Contain                   ${header_text}                                                                                             ${username}
    Sleep                            1s

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
    Go To    https://www.aliexpress.com/item/4000069746947.html?spm=a2g0o.productlist.main.5.c81f7oZS7oZSki&algo_pvid=55d6eef0-54d4-450d-ba09-cf69a8ee6be2&algo_exp_id=55d6eef0-54d4-450d-ba09-cf69a8ee6be2-2&pdp_ext_f=%7B%22order%22%3A%22362%22%2C%22eval%22%3A%221%22%7D&pdp_npi=4%40dis%21EGP%214506.68%212433.35%21%21%2180.99%2143.73%21%40212a70c117461682390495688eaadb%2110000000190118647%21sea%21EG%212623455721%21ABX&curPageLogUid=ZKy5u52E33IW&utparam-url=scene%3Asearch%7Cquery_from%3A&gatewayAdapt=glo2ara
    Sleep    10
    Wait Until Element Is Visible    css:.slider--slider--VKj5hty    60s
    ${elements}=    Get WebElements    css:.slider--item--RpyeewA
    Click Element    ${elements}[4]
    Wait Until Element Is Visible    css:.magnifier--image--RM17RL2.magnifier--zoom--zzDgZB8    10s
    Mouse Over    css:.magnifier--image--RM17RL2.magnifier--zoom--zzDgZB8
    Sleep    5
    ${zoomed}=    Get Element Attribute    css:.magnifier--image--RM17RL2    class
    Should Not Contain    ${zoomed}    magnifier--zoom--zzDgZB8
    Click Element    css:.magnifier--behiver--cY4D2TR
    Wait Until Element Is Visible    css:.comet-v2-modal-body    10s
    Sleep    3

Scenario Eight
    Go To    https://best.aliexpress.com/
    Sleep    5
    Wait Until Element Is Visible    css:.iu_hs    60s
    ${price_before}=    Get Text    css:.iu_hs
    Wait Until Element Is Visible    css:.ship-to--menuItem--WdBDsYl    10s
    Click Element    css:.ship-to--menuItem--WdBDsYl
    Wait Until Element Is Visible    css:.select--text--1b85oDo    10s
    Click Element    css:.select--text--1b85oDo
    Wait Until Element Is Visible    css:.select--item--32FADYB    10s
    Click Element    css:.country-flag-y2023.SA
    Wait Until Element Is Visible    css:.es--saveBtn--w8EuBuy    10s
    Click Element    css:.es--saveBtn--w8EuBuy
    Sleep    3
    Wait Until Element Is Visible    css:.iu_hs    10s
    ${price_after}=    Get Text    css:.iu_hs
    Should Not Be Equal As Strings    ${price_before}    ${price_after}
    Sleep    3


*** Keywords ***
Open Browser To AliExpress
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Set Selenium Speed    0.3s

Click Search Button
    Click Button    css=div.pc-header--search--3hnHLKw input.search--submit--2VTbd-T.search--newSubmit--3BlVRKw

Wait Constant Time
    Sleep    ${SLEEP_TIME}

Reset Browser State
    Delete All Cookies
    Execute Javascript    window.localStorage.clear();
    Execute Javascript    window.sessionStorage.clear();
    Execute Javascript    location.reload(true)

Close Popup
    Wait Until Element Is Visible    xpath=//*[@id="_global_header_23_"]/div
    Click Element                    css=img._24EHh
