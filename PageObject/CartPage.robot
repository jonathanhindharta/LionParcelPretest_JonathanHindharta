*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${page_title}     Your Cart
${app_logo_xpath_class}     app_logo
${burger_menu_xpath_id}     react-burger-menu-btn
${shopping_cart_xpath_id}     shopping_cart_container
${page_title_xpath}     //span[@data-test='title']
${item_name_xpath}      //div[@data-test="inventory-item-name"]
${item_desc_xpath}      //div[@data-test="inventory-item-desc"]
${item_price_xpath}      //div[@data-test="inventory-item-price"]
${item_qty_xpath}      //div[@data-test="item-quantity"]
${continue_shopping_xpath_id}     continue-shopping
${shopping_cart_badge_xpath}     //span[@data-test="shopping-cart-badge"]
${remove_item_button_xpath_id}     remove-sauce-labs-backpack
${checkout_button_xpath_id}    checkout

*** Keywords ***
User Should Redirect To Cart Page
    element should be visible    class=${app_logo_xpath_class}
    element should be visible    id=${burger_menu_xpath_id}
    element should be visible    id=${shopping_cart_xpath_id}
    element should be visible    xpath=${page_title_xpath}
    element should be visible    xpath=${item_name_xpath}
    element should be visible    xpath=${item_desc_xpath}
    element should be visible    xpath=${item_price_xpath}
    element should be visible    xpath=${item_qty_xpath}
    element should be visible    id=${continue_shopping_xpath_id}
    ${price_text}=    Get Text    xpath=${item_price_xpath}
    ${item_name_text}=    Get Text    xpath=${item_name_xpath}
    ${item_desc_text}=    Get Text    xpath=${item_desc_xpath}
    ${item_qty_text}=    Get Text    xpath=${item_qty_xpath}
    ${page_title_text}=    Get Text    xpath=${page_title_xpath}
    # assert that item name, desc, and price should be same with detail in Inventory Item Page
    should be equal as strings    ${item_desc_text}     ${global_item_desc}
    should be equal as strings    ${price_text}     ${global_price_text}
    should be equal as strings    ${item_name_text}     ${global_item_name}
    should be equal as strings    ${page_title_text}     ${page_title}
    element should be visible    id=${remove_item_button_xpath_id}
    element should be visible    xpath=${shopping_cart_badge_xpath}
    element should be visible    id=${checkout_button_xpath_id}
    ${shopping_cart_badge_text}=    Get Text    xpath=${shopping_cart_badge_xpath}
    # assert text to equals 1, because already add 1 item
    should be equal as strings    ${shopping_cart_badge_text}     1
    should be equal as strings      ${item_qty_text}    1
User Click Checkout Button
    click button    id=${checkout_button_xpath_id}
    sleep    3s



