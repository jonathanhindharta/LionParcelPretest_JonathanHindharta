*** Settings ***
Library    AppiumLibrary

*** Variables ***
${time_out_element_visible}     20s
${permission_foreground_button_xpath_id}     com.android.permissioncontroller:id/permission_allow_foreground_only_button

${origin_address_text}
${check_rate_title_xpath}     //android.widget.TextView[@text="Cek Tarif untuk Pengirimanmu"]
${origin_address_xpath_id}  com.lionparcel.services.consumer:id/edtOriginAddress
${destination_address_xpath_id}  com.lionparcel.services.consumer:id/edtDestinationAddress
${switch_button_xpath}  (//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[3]
${check_rate_button_xpath}  com.lionparcel.services.consumer:id/btnCheckTariff

${default_total_weight}     1
${total_weight_xpath_id}  com.lionparcel.services.consumer:id/edtTotalWeight
${add_ddtl_button_xpath_id}  com.lionparcel.services.consumer:id/btnAddDetail
${product_rate_layout_xpath_id}     com.lionparcel.services.consumer:id/layoutTariffProductCard
${def_service_xpath_id}     com.lionparcel.services.consumer:id/txtTotalTariffEstimation

${total_rate_est_xpath_id}     com.lionparcel.services.consumer:id/txtTotalTariffEstimation
${pick_up_button_xpath_id}     com.lionparcel.services.consumer:id/buttonPickUp



*** Keywords ***
Check Rate Page With Permission Pop Up Will Be Appear
     APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${permission_foreground_button_xpath_id}     ${time_out_element_visible}

User Click Allow Fore Ground Permission Only Button
    AppiumLibrary.click element    id=${permission_foreground_button_xpath_id}
    sleep    2s

Permission Pop Up Will Be Disappear And Check Rate Page Element Will Be Appear
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    xpath=${check_rate_title_xpath}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${origin_address_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${destination_address_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    xpath=${switch_button_xpath}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${check_rate_button_xpath}     ${time_out_element_visible}
    ${origin_address_text}=    Get Text    id=${origin_address_xpath_id}
    Set Global Variable     ${global_origin_address_text}      ${origin_address_text}
    # assert should not be empty  because it will be have default value our current subdistrict location
    should not be empty    ${origin_address_text}

User Click Destination Address Field
    AppiumLibrary.click element    id=${destination_address_xpath_id}
    sleep    7s

Check Rate Page Element Will Be Appear And Destination Address Will Be Filled With Choosen Sub District Address
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    xpath=${check_rate_title_xpath}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${origin_address_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${destination_address_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    xpath=${switch_button_xpath}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${check_rate_button_xpath}     ${time_out_element_visible}
    ${origin_address_text}=    Get Text    id=${origin_address_xpath_id}
    should be equal    ${origin_address_text}       ${global_origin_address_text}
    ${destination_address_text}=    Get Text    id=${destination_address_xpath_id}
    should be equal    ${destination_address_text}       ${global_destination_address}

User Click Check Rate Button
    AppiumLibrary.click element    id=${check_rate_button_xpath}
    sleep    3s

Default Weight And List Service With Rate Will Be Appear
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${total_weight_xpath_id}     ${time_out_element_visible}
    ${total_weight_text}=    Get Text    id=${total_weight_xpath_id}
    should be equal    ${total_weight_text}       ${default_total_weight}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${add_ddtl_button_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${product_rate_layout_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${def_service_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.Execute Script    mobile: swipe    {"startX": 500, "startY": 1000, "endX": 500, "endY": 100, "duration": 1000}
    sleep    3s
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${total_rate_est_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${pick_up_button_xpath_id}     ${time_out_element_visible}
