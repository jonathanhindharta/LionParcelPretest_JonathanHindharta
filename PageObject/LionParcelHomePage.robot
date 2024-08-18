*** Settings ***
Library    AppiumLibrary

*** Variables ***
${time_out_element_visible}     30s
${ads_highlight_xpath_id}     com.lionparcel.services.consumer:id/clHighlightShare
${close_ads_button_xpath_id}     com.lionparcel.services.consumer:id/ivClose
${share_ads_button_xpath_id}        com.lionparcel.services.consumer:id/llShareSection

${pop_up_tracking_xpath}     /hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView
${pop_up_tracking_close_button_xpath_id}    com.lionparcel.services.consumer:id/ivClose

${tittle_text_xpath_id}  com.lionparcel.services.consumer:id/txtTittle
${desc_text_xpath_id}  com.lionparcel.services.consumer:id/txtDescription
${indicator_xpath_id}  com.lionparcel.services.consumer:id/indicator
${next_button_xpath_id}  com.lionparcel.services.consumer:id/btnNext

${pick_up_pop_up_xpath_id}  com.lionparcel.services.consumer:id/mcvParent
${pick_up_close_xpath_id}  com.lionparcel.services.consumer:id/imgClose

${input_stt_xpath_id}  com.lionparcel.services.consumer:id/txtInputStt
${chat_xpath_id}  com.lionparcel.services.consumer:id/ivChat
${imgnotification_xpath_id}  com.lionparcel.services.consumer:id/imgNotification
${member_desc_xpath_id}  com.lionparcel.services.consumer:id/llMembershipDescription
${disc_alert_xpath_id}  com.lionparcel.services.consumer:id/llAlert

${pick_up_menu_xpath}  (//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[4]
${drop_package_menu_xpath}  (//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[5]
${check_rate_menu_xpath}  (//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[6]
${fill_together_menu_xpath}  (//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[7]
${claim_package_menu_xpath}  (//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[8]
${report_menu_xpath}  (//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[9]
${cs_liona_menu_xpath}  (//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[10]

${home_nav_xpath_id}  com.lionparcel.services.consumer:id/navHome
${chat_nav_xpath_id}  com.lionparcel.services.consumer:id/navTrack
${payment_nav_xpath_id}  com.lionparcel.services.consumer:id/navPayment
${account_nav_xpath_id}  com.lionparcel.services.consumer:id/navAccount

*** Keywords ***
Lion Parcel Offer Ads Will Be Appear
     #APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${ads_highlight_xpath_id}
     APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${close_ads_button_xpath_id}
     #APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${share_ads_button_xpath_id}

User Click Close Ads Button
    AppiumLibrary.click element    id=${close_ads_button_xpath_id}
    sleep    2s

Lion Parcel Home Page With Pop Up Tracking Will Appear
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${tittle_text_xpath_id}   ${time_out_element_visible}
    #APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${desc_text_xpath_id}     ${time_out_element_visible}
    #APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${indicator_xpath_id}     ${time_out_element_visible}
    #APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${next_button_xpath_id}       ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${pop_up_tracking_close_button_xpath_id}      ${time_out_element_visible}

User Click Close Pop Up Tracking Button
    AppiumLibrary.click element    id=${pop_up_tracking_close_button_xpath_id}

Pick Up Offer Pop Up Will Appear
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${pick_up_pop_up_xpath_id}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${pick_up_close_xpath_id}

User Click Close Pick Up Offer Pop Up
    AppiumLibrary.click element    id=${pick_up_close_xpath_id}

Pick Up Offer Pop Up Will Be Closed and User Can See All Menu in Home Page
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${input_stt_xpath_id}   ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${chat_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${imgnotification_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${member_desc_xpath_id}       ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${disc_alert_xpath_id}      ${time_out_element_visible}

    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    xpath=${pick_up_menu_xpath}   ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    xpath=${drop_package_menu_xpath}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    xpath=${check_rate_menu_xpath}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    xpath=${fill_together_menu_xpath}       ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    xpath=${claim_package_menu_xpath}      ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    xpath=${report_menu_xpath}      ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    xpath=${claim_package_menu_xpath}      ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    xpath=${cs_liona_menu_xpath}      ${time_out_element_visible}

    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${home_nav_xpath_id}   ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${chat_nav_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${payment_nav_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${account_nav_xpath_id}       ${time_out_element_visible}

User Click Check Rate Menu
    AppiumLibrary.click element    xpath=${check_rate_menu_xpath}
    sleep    2s