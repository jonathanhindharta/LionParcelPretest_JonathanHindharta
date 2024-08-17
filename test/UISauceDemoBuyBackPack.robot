*** Settings ***
Documentation    This is For Assignment 2 Create an Automated Test for the user journey of shopping cart checkout
Resource    ../PageObject/LoginPage.robot
Resource    ../PageObject/HomePage.robot
Resource    ../PageObject/InventoryItemPage.robot
Resource    ../PageObject/CartPage.robot
Resource    ../PageObject/CheckOutInfoPage.robot
Resource    ../PageObject/CheckOutOverviewPage.robot
Resource    ../PageObject/CheckOutCompletePage.robot

*** Variables ***
${item_name_backpack}         Sauce Labs Backpack

*** Test Cases ***
Scenario : Login to Sauce Demo Web With Valid UserName And Password
    Given LoginPage.User Open Sauce Demo Web
    Then LoginPage.Login Page Element Should Be Loaded
    When LoginPage.Fill The Login Form and Click Login
    Then HomePage.User Should Redirect To Home Page

Scenario : User Click Item Sauce Labs Backpack
    When HomePage.User Click Item      ${item_name_backpack}
    Then InventoryItemPage.User Should Redirect To Inventory Item Page of    ${item_name_backpack}
    When InventoryItemPage.User Click Add To Cart
    Then InventoryItemPage.Shopping Cart Badge Should Be Appear

Scenario : User Open Cart Page And Proceed Until Payment
    When InventoryItemPage.User Click Shopping Cart
    Then CartPage.User Should Redirect To Cart Page
    When CartPage.User Click Checkout Button
    Then CheckOutInfoPage.User Should Redirect To Check Out Information Page
    When CheckOutInfoPage.User Fill Information Form And Click Continue
    Then CheckOutOverviewPage.User Should Redirect To Check Out Overview Page
    When CheckOutOverviewPage.User Click Finish Button
    Then CheckOutCompletePage.User Should Redirect To Check Out Complete Page
    When CheckOutCompletePage.User Click Back To Product Button
    Then HomePage.User Should Redirect To Home Page
    close browser




