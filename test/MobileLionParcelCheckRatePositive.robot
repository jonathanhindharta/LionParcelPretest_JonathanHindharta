*** Settings ***
Documentation    This is For Assignment 4 Positive Test Of Check Rate Menu
Resource    ../PageObject/LionParcelLoginPage.robot
Resource    ../PageObject/LionParcelHomePage.robot
Resource    ../PageObject/LionParcelCheckRatePage.robot
Resource    ../PageObject/LionParcelSearchLocationPage.robot


*** Test Cases ***
Scenario : Open Lion Parcel Android App And Check Rate With Destination SubDistrict Same With Origin SubDisctrict
    Given LionParcelLoginPage.User Open Lion Parcel App Home Page
    Then LionParcelLoginPage.User Will Be Redirected To Login Page And Pop Up Privacy Policy Appear
    When LionParcelLoginPage.User Click Agree Button in Privacy Policy Pop Up
    Then LionParcelLoginPage.Pop Up Privacy Policy Will Be Disappear And Login Page Will Be Loaded
    When LionParcelLoginPage.User Click Continue Without Account
    Then LionParcelHomePage.Lion Parcel Home Page With Pop Up Tracking Will Appear
    When LionParcelHomePage.User Click Close Pop Up Tracking Button
    Then LionParcelHomePage.Pick Up Offer Pop Up Will Appear
    When LionParcelHomePage.User Click Close Pick Up Offer Pop Up
    Then LionParcelHomePage.Pick Up Offer Pop Up Will Be Closed and User Can See All Menu in Home Page
    When LionParcelHomePage.User Click Check Rate Menu
    Then LionParcelCheckRatePage.Check Rate Page With Permission Pop Up Will Be Appear
    When LionParcelCheckRatePage.User Click Allow Fore Ground Permission Only Button
    Then LionParcelCheckRatePage.Permission Pop Up Will Be Disappear And Check Rate Page Element Will Be Appear
    When LionParcelCheckRatePage.User Click Destination Address Field
    Then LionParcelSearchLocationPage.Search Location Page Will Be Appear
    When LionParcelSearchLocationPage.User Fill Route Search Field Same With    ${global_origin_address_text}
    Then LionParcelCheckRatePage.Check Rate Page Element Will Be Appear And Destination Address Will Be Filled With Choosen Sub District Address
    When LionParcelCheckRatePage.User Click Check Rate Button
    Then LionParcelCheckRatePage.Default Weight And List Service With Rate Will Be Appear
    close application

