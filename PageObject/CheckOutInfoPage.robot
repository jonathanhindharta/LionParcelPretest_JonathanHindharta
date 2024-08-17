*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${check_out_info_page_title}     Checkout: Your Information
${first_name}     Jonathan
${last_Name}      Hindharta
${postal_code}  10160
${app_logo_xpath_class}     app_logo
${burger_menu_xpath_id}     react-burger-menu-btn
${shopping_cart_xpath_id}     shopping_cart_container
${page_title_xpath}     //span[@data-test='title']
${shopping_cart_badge_xpath}     //span[@data-test="shopping-cart-badge"]
${first_name_xpath_id}     first-name
${last_name_xpath_id}    last-name
${postal_code_xpath_id}    postal-code
${cancel_button_xpath_id}    cancel
${continue_button_xpath_id}    continue

*** Keywords ***
User Should Redirect To Check Out Information Page
    element should be visible    class=${app_logo_xpath_class}
    element should be visible    id=${burger_menu_xpath_id}
    element should be visible    id=${shopping_cart_xpath_id}
    element should be visible    xpath=${page_title_xpath}
    element should be visible    xpath=${shopping_cart_badge_xpath}
    ${shopping_cart_badge_text}=    Get Text    xpath=${shopping_cart_badge_xpath}
    # assert text to equals 1, because already add 1 item
    should be equal as strings    ${shopping_cart_badge_text}     1
    element should be visible    id=${first_name_xpath_id}
    element should be visible    id=${last_name_xpath_id}
    element should be visible    id=${postal_code_xpath_id}
    element should be visible    id=${cancel_button_xpath_id}
    element should be visible    id=${continue_button_xpath_id}
    ${page_title_text}=    Get Text    xpath=${page_title_xpath}
    should be equal as strings    ${page_title_text}     ${check_out_info_page_title}

User Fill Information Form And Click Continue
    input text    id:${first_name_xpath_id}   ${first_name}
    input text    id:${last_name_xpath_id}   ${last_Name}
    input text    id:${postal_code_xpath_id}   ${postal_code}
    click button    ${continue_button_xpath_id}
    Sleep    2s



