*** Settings ***
Documentation    This is For Assignment 1 create automation test API POST CREATE USER
Resource    ../ObjectRepository/PostCreateUserRepository.robot

*** Test Cases ***
Scenario : Post Create User With Name And Job
    When PostCreateUserRepository.Post Created User With Name And Job Filled
    Then PostCreateUserRepository.Response Should Have Status 201
    AND PostCreateUserRepository.Response Should Contains Some Keys
    AND PostCreateUserRepository.Response Should Have Correct Value

