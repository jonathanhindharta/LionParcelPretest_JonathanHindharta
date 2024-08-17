*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${sauce_demo_url}   https://www.saucedemo.com
${user_name}     standard_user
${password}     secret_sauce
${login_logo_xpath_class}   login_logo
${user_name_xpath_id}   user-name
${password_xpath_id}   password
${login-button_xpath_id}   login-button


*** Keywords ***
User Open Sauce Demo Web
    create webdriver    Chrome
    go to    ${sauce_demo_url}
    Maximize Browser Window

Login Page Element Should Be Loaded
    # assert some elements that should be loaded after user open login page
    element should be visible    class=${login_logo_xpath_class}
    element should be visible    id=${user_name_xpath_id}
    element should be visible    id=${password_xpath_id}
    element should be visible    id=${login-button_xpath_id}

Fill The Login Form and Click Login
    input text    id:${user_name_xpath_id}   ${user_name}
    input password    id:${password_xpath_id}    ${password}
    click button    ${login-button_xpath_id}
    Sleep    2s
