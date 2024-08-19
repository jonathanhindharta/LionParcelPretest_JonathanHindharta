*** Settings ***
Library    AppiumLibrary

*** Variables ***
${time_out_element_visible}     20s

${origin_address_text}
${back_button_xpath}    //android.widget.ImageButton[@content-desc="Navigate up"]
${col_toolbar_xpath_id}  com.lionparcel.services.consumer:id/collapsingToolbar
${toolbar_xpath_id}  com.lionparcel.services.consumer:id/toolbar
${relative_layout_xpath}    //android.widget.RelativeLayout
${llKeyword_xpath_id}  com.lionparcel.services.consumer:id/llKeyword
${llKeyword_xpath_id}  com.lionparcel.services.consumer:id/edtRouteSearch
${route_edit_xpath_id}    com.lionparcel.services.consumer:id/edtRouteSearch

${route_result_xpath_id}    com.lionparcel.services.consumer:id/rvRouteSearchResult
${row_result_xpath_id}    com.lionparcel.services.consumer:id/clCategoryPackageRow
${district_name_text_xpath_id}     com.lionparcel.services.consumer:id/txtDistrictRouteName
${city_name_text_xpath_id}     com.lionparcel.services.consumer:id/txtCityRouteName

${one_char_text}    a
${wrong_destination_text}   zzzzz
${destination_outside_java}  Sorong Barat
${err_msg_text_xpath_id}  com.lionparcel.services.consumer:id/txtErrorMessage
${err_msg_text_should_be}   Minimal 3 karakter
${location_not_found_text_xpath}  //android.widget.TextView[@text="Lokasi tidak ditemukan"]
${location_not_reg_text_xpath}  //android.widget.TextView[@text="Lokasi yang kamu masukkan tidak ada dalam daftar"]



*** Keywords ***
Search Location Page Will Be Appear
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${col_toolbar_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${toolbar_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    xpath=${relative_layout_xpath}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${llKeyword_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${route_edit_xpath_id}     ${time_out_element_visible}

User Fill Route Search Field Same With
    [Arguments]    ${route_name}
    input text    id=${route_edit_xpath_id}   ${route_name}
    sleep    3s
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${route_result_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${row_result_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${district_name_text_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${city_name_text_xpath_id}     ${time_out_element_visible}
    ${district_name_text}=    Get Text    id=${district_name_text_xpath_id}
    ${city_name_text}=    Get Text    id=${city_name_text_xpath_id}
    ${destination_address}=     EVALUATE    '${district_name_text}, ${city_name_text}'
    Set Global Variable     ${global_destination_address}      ${destination_address}
    AppiumLibrary.click element    id=${row_result_xpath_id}
    sleep    2s


User Fill Route Search Field Only With 1 Character
    input text    id=${route_edit_xpath_id}   ${one_char_text}
    sleep    2s

Warning Of Minimum 3 Character Will Be Appear
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${err_msg_text_xpath_id}     ${time_out_element_visible}
    ${err_msg_text}=    Get Text    id=${err_msg_text_xpath_id}
    should be equal    ${err_msg_text}      ${err_msg_text_should_be}

User Fill Route Search Field With Wrong SubDisctrict Address
    input text    id=${route_edit_xpath_id}   ${wrong_destination_text}
    sleep    2s

Warning Of Location Not Found Will Be Appear
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    xpath=${location_not_found_text_xpath}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    xpath=${location_not_reg_text_xpath}     ${time_out_element_visible}