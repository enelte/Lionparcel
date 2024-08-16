*** Settings ***
Library    SeleniumLibrary
Library    collections
Resource    Keywords.robot

*** Variables ***
${browser}      Google Chrome
${url}    https://www.saucedemo.com/
${username}    standard_user
${locked_username}    locked_out_user
${password}    secret_sauce
${inventory_url}    https://www.saucedemo.com/inventory.html
${cart_url}      https://www.saucedemo.com/cart.html

*** Test Cases ***
Login
    Open Browser    ${url}  ${browser}
    Given I login   ${username}  ${password}
    When I am on homepage   ${inventory_url}
    Then I log out the account
    And Verify that the account has been logged out

Product Selection
    Open Browser    ${url}  ${browser}
    Given I login   ${username}  ${password}
    When I am on homepage   ${inventory_url}
    Then I add products to cart
    And I verify that the product is on cart


View Cart
    Open Browser    ${url}  ${browser}
    Given I login   ${username}  ${password}
    When I am on homepage   ${inventory_url}
    Then I add products to cart
    And I go to cart page   ${cart_url}
    And I verify that the product is on cart page


Checkout Item
    Open Browser    ${url}  ${browser}
    Given I login   ${username}  ${password}
    And I am on homepage   ${inventory_url}
    And I add products to cart
    When I go to cart page   ${cart_url}
    Then I enter the customer information
    Sleep   1
    And I finalize the order

