*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    TestSuite.robot

*** Keywords ***
Open URL
    [Arguments] ${url}  ${browser}
    Open Browser    ${url}    ${browser}

I login
    [Arguments]     ${username}  ${password}
    Input Text    id=user-name      ${username}
    Input Password    id=password    ${password}
    Click Element    id=login-button

I am on homepage
    [Arguments]  ${expected_url}
    ${current_url}=  Get Location
    Should Be Equal  ${current_url}  ${expected_url}

I log out the account
    Click Element    id=react-burger-menu-btn
    Sleep    3
    Click Element    //a[@id="logout_sidebar_link"]

Verify that the account has been logged out
    Close Browser

I am on inventory page
    [Arguments]     ${inventory_url}
    ${current_url}  Get Location
    Should Be Equal    ${current_url}    ${inventory_url}

I add products to cart
    Click Element    id=add-to-cart-sauce-labs-bike-light
    Click Element    id=add-to-cart-sauce-labs-bolt-t-shirt
    Click Element    id=add-to-cart-sauce-labs-backpack

I verify that the product is on cart
    Element Should Contain    //span[@data-test="shopping-cart-badge"]    3

I go to cart page
    [Arguments]     ${expected_url}
    Click Element   //div[@id="shopping_cart_container"]
    ${current_url}=    Get Location
    Should Be Equal    ${current_url}    ${expected_url}
    
I verify that the product is on cart page
    Element Should Contain    //div[@class="cart_item"]    3
    Sleep    1
    Element Text Should Be    //a[@id="item_0_title_link"]    Sauce Labs Bike Light
    Element Text Should Be    //a[@id="item_1_title_link"]    Sauce Labs Bolt T-Shirt
    Element Text Should Be    //a[@id="item_4_title_link"]    Sauce Labs Backpack
I enter the customer information
    Click Element    id=checkout
    Input Text    id=first-name    Nicholas
    Input Text    id=last-name    Lingga
    Input Text    id=postal-code    123456
    Sleep   1

I finalize the order
    Click Element    id=continue
    Element Text Should Be    //span[@class="title"]    Checkout: Overview
    Element Text Should Be    //div[@data-test="shipping-info-label"]    Shipping Information:
    Click Element    id=finish
    Element Text Should Be    //span[@class="title"]    Checkout: Complete!
    Element Should Be Visible        id=checkout_complete_container    Thank you for your order!
    Element Should Be Visible    id=back-to-products    Back Home
