*** Settings ***
Documentation    This is For Assignment 1 create automation test API GET SINGLE USER
Resource    ../ObjectRepository/GetSingleUserRepository.robot

*** Test Cases ***
Scenario : Get Valid Single User Based On ID
    When GetSingleUserRepository.Hit API Get Single Users With Valid ID
    Then GetSingleUserRepository.Response Should Have Status 200
    AND GetSingleUserRepository.Response Should Contains Some Keys
    AND GetSingleUserRepository.Response Should Have Correct Value

