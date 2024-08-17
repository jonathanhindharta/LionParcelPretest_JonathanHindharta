*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn

*** Variables ***
${check_out_comp_page_title}     Checkout: Complete!
${complete_header_title}     Thank you for your order!
${complete_title}     Your order has been dispatched, and will arrive just as fast as the pony can get there!
${app_logo_xpath_class}     app_logo
${burger_menu_xpath_id}     react-burger-menu-btn
${shopping_cart_xpath_id}     shopping_cart_container
${page_title_xpath}     //span[@data-test='title']
${shopping_cart_badge_xpath}     //span[@data-test="shopping-cart-badge"]
${checklist_image_class}     pony_express
${complete_header_text_xpath}     //h2[@data-test="complete-header"]
${complete_text_xpath}     //div[@data-test="complete-text"]
${back_to_product_button_xpath_id}    back-to-products

*** Keywords ***
User Should Redirect To Check Out Complete Page
    element should be visible    class=${app_logo_xpath_class}
    element should be visible    id=${burger_menu_xpath_id}
    element should be visible    id=${shopping_cart_xpath_id}
    element should be visible    xpath=${page_title_xpath}
    # assert not visible because already successful to check out
    element should not be visible    xpath=${shopping_cart_badge_xpath}
    element should be visible    class=${checklist_image_class}
    element should be visible    xpath=${complete_header_text_xpath}
    element should be visible    xpath=${complete_text_xpath}

    ${page_title_text}=    Get Text    xpath=${page_title_xpath}
    should be equal as strings    ${page_title_text}     ${check_out_comp_page_title}

    ${complete_header_text}=    Get Text    xpath=${complete_header_text_xpath}
    ${complete_text}=    Get Text    xpath=${complete_text_xpath}
    should be equal as strings    ${complete_header_text}     ${complete_header_title}
    should be equal as strings    ${complete_text}     ${complete_title}

    element should be visible    id=${back_to_product_button_xpath_id}

User Click Back To Product Button
    click button    ${back_to_product_button_xpath_id}
    Sleep    2s



