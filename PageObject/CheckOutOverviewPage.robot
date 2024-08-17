*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn

*** Variables ***
${check_out_ovw_page_title}     Checkout: Overview
${payment_info_name}        SauceCard #31337
${shipping_name}        Free Pony Express Delivery!
${app_logo_xpath_class}     app_logo
${burger_menu_xpath_id}     react-burger-menu-btn
${shopping_cart_xpath_id}     shopping_cart_container
${page_title_xpath}     //span[@data-test='title']
${shopping_cart_badge_xpath}     //span[@data-test="shopping-cart-badge"]
${cancel_button_xpath_id}    cancel
${finish_button_xpath_id}    finish
${item_name_xpath}      //div[@data-test="inventory-item-name"]
${item_desc_xpath}      //div[@data-test="inventory-item-desc"]
${item_price_xpath}      //div[@data-test="inventory-item-price"]
${item_qty_xpath}      //div[@data-test="item-quantity"]
${payment_info_value_xpath}      //div[@data-test="payment-info-value"]
${shipping_info_value_xpath}      //div[@data-test="shipping-info-value"]
${subtotal_label_xpath}      //div[@data-test="subtotal-label"]
${tax_label_xpath}      //div[@data-test="tax-label"]
${total_label_xpath}      //div[@data-test="total-label"]

*** Keywords ***
User Should Redirect To Check Out Overview Page
    element should be visible    class=${app_logo_xpath_class}
    element should be visible    id=${burger_menu_xpath_id}
    element should be visible    id=${shopping_cart_xpath_id}
    element should be visible    xpath=${page_title_xpath}
    element should be visible    xpath=${shopping_cart_badge_xpath}
    ${shopping_cart_badge_text}=    Get Text    xpath=${shopping_cart_badge_xpath}
    # assert text to equals 1, because already add 1 item
    should be equal as strings    ${shopping_cart_badge_text}     1
    ${page_title_text}=    Get Text    xpath=${page_title_xpath}
    should be equal as strings    ${page_title_text}     ${check_out_ovw_page_title}

    element should be visible    xpath=${item_name_xpath}
    element should be visible    xpath=${item_desc_xpath}
    element should be visible    xpath=${item_price_xpath}
    element should be visible    xpath=${item_qty_xpath}
    ${item_name_text}=    Get Text    xpath=${item_name_xpath}
    ${item_desc_text}=    Get Text    xpath=${item_desc_xpath}
    ${item_qty_text}=    Get Text    xpath=${item_qty_xpath}
    ${page_title_text}=    Get Text    xpath=${page_title_xpath}
    ${price_text}=    Get Text    xpath=${item_price_xpath}
    # assert that item name, desc, and price should be same with detail in Inventory Item Page
    should be equal as strings    ${item_desc_text}     ${global_item_desc}
    should be equal as strings    ${price_text}     ${global_price_text}
    should be equal as strings    ${item_name_text}     ${global_item_name}
    # assert text to equals 1, because already add 1 item
    should be equal as strings      ${item_qty_text}    1

    element should be visible    xpath=${payment_info_value_xpath}
    element should be visible    xpath=${shipping_info_value_xpath}
    element should be visible    xpath=${subtotal_label_xpath}
    element should be visible    xpath=${tax_label_xpath}
    element should be visible    xpath=${total_label_xpath}
    ${payment_info_text}=    Get Text    xpath=${payment_info_value_xpath}
    ${shipping_info_text}=    Get Text    xpath=${shipping_info_value_xpath}
    ${subtotal_text}=    Get Text    xpath=${subtotal_label_xpath}
    ${tax_text}=    Get Text    xpath=${tax_label_xpath}
    ${total_text}=    Get Text    xpath=${total_label_xpath}
    # assert payment info and shipping info label should as default
    should be equal as strings    ${payment_info_text}     ${payment_info_name}
    should be equal as strings    ${shipping_info_text}     ${shipping_name}
    # assert subtotal value equal price in inventory item page
    should contain    ${subtotal_text}      ${global_price_text}
    # assert subtotal value + tax value should equal total value
    ${subtotal_no_string} =     Evaluate    "${subtotal_text}".replace("Item total: $", "")
    ${subtotal_no_string} =     Evaluate    float("${subtotal_no_string}")
    ${tax_no_string} =     Evaluate    "${tax_text}".replace("Tax: $", "")
    ${tax_no_string} =     Evaluate    float("${tax_no_string}")
    ${total_no_string} =     Evaluate    "${total_text}".replace("Total: $", "")
    ${total_no_string} =     Evaluate    float("${total_no_string}")
    ${total_calculate} =    Evaluate    ${subtotal_no_string} + ${tax_no_string}
    should be equal    ${total_no_string}   ${total_calculate}

User Click Finish Button
    click button    ${finish_button_xpath_id}
    Sleep    2s



