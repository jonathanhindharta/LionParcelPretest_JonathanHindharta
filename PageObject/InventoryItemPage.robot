*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${app_logo_xpath_class}     app_logo
${burger_menu_xpath_id}     react-burger-menu-btn
${shopping_cart_xpath_id}     shopping_cart_container
${add_to_cart_xpath_id}     add-to-cart
${item_name_xpath}      //div[@data-test="inventory-item-name"]
${item_desc_xpath}      //div[@data-test="inventory-item-desc"]
${item_price_xpath}      //div[@data-test="inventory-item-price"]
${item_img_xpath_class}   inventory_details_img
${back_to_product_xpath_id}     back-to-products
${shopping_cart_badge_xpath}     //span[@data-test="shopping-cart-badge"]
${remove_button_xpath_id}     remove

*** Keywords ***
User Should Redirect To Inventory Item Page of
    [Arguments]    ${item_name_backpack}
    element should be visible    class=${app_logo_xpath_class}
    element should be visible    id=${burger_menu_xpath_id}
    element should be visible    id=${shopping_cart_xpath_id}
    element should be visible    id=${add_to_cart_xpath_id}
    element should be visible    xpath=${item_name_xpath}
    element should be visible    xpath=${item_desc_xpath}
    element should be visible    xpath=${item_price_xpath}
    element should be visible    class=${item_img_xpath_class}
    element should be visible    id=${back_to_product_xpath_id}
    ${price_text}=    Get Text    xpath=${item_price_xpath}
    ${item_desc_text}=    Get Text    xpath=${item_desc_xpath}
    Set Global Variable     ${global_price_text}      ${price_text}
    Set Global Variable     ${global_item_name}      ${item_name_backpack}
    Set Global Variable     ${global_item_desc}      ${item_desc_text}
    element should contain      xpath=${item_name_xpath}    ${item_name_backpack}

User Click Add To Cart
    click element    id=${add_to_cart_xpath_id}

Shopping Cart Badge Should Be Appear
    element should be visible    id=${remove_button_xpath_id}
    element should be visible    xpath=${shopping_cart_badge_xpath}
    ${shopping_cart_badge_text}=    Get Text    xpath=${shopping_cart_badge_xpath}
    # assert text to equals 1, because already add 1 item
    should be equal as strings    ${shopping_cart_badge_text}     1

User Click Shopping Cart
    click element    id=${shopping_cart_xpath_id}
    sleep    2s



