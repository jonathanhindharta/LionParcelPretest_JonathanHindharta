*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${app_logo_xpath_class}     app_logo
${burger_menu_xpath_id}     react-burger-menu-btn
${shopping_cart_xpath_id}     shopping_cart_container
${product_title_xpath}     //span[@data-test='title']
${product_sort_container_xpath}     //select[@data-test='product-sort-container']
${inventory_container_xpath_id}     inventory_container
${backpack_a_xpath}         //div[text()='${item_name_backpack}']/ancestor::a

*** Keywords ***
User Should Redirect To Home Page
    # assert some elements that should be loaded after user redirected to home page
    element should be visible    class=${app_logo_xpath_class}
    element should be visible    id=${burger_menu_xpath_id}
    element should be visible    id=${shopping_cart_xpath_id}
    element should be visible    xpath=${product_title_xpath}
    element should be visible    xpath=${product_sort_container_xpath}
    element should be visible    id=${inventory_container_xpath_id}

User Click Item
    [Arguments]    ${item_name_backpack}
    element should be visible    ${backpack_a_xpath}
    click element    ${backpack_a_xpath}
    Sleep    2s




