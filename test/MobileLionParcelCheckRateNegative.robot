*** Settings ***
Documentation    This is For Assignment 4 Negative Test Of Check Rate Menu
Resource    ../PageObject/LionParcelLoginPage.robot
Resource    ../PageObject/LionParcelHomePage.robot
Resource    ../PageObject/LionParcelCheckRatePage.robot
Resource    ../PageObject/LionParcelSearchLocationPage.robot


*** Test Cases ***
Scenario : Open Lion Parcel Android App And Check Rate With Input Wrong Destinantion
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
    When LionParcelSearchLocationPage.User Fill Route Search Field Only With 1 Character
    Then LionParcelSearchLocationPage.Warning Of Minimum 3 Character Will Be Appear
    When LionParcelSearchLocationPage.User Fill Route Search Field With Wrong SubDisctrict Address
    Then LionParcelSearchLocationPage.Warning Of Location Not Found Will Be Appear
    close application

