*** Settings ***
Library    AppiumLibrary

*** Variables ***
${remote_url}    http://127.0.0.1:4723
${plaftorm_name}    Android
${platform_version}    11
${device_name}    29e46e30
${app_package}    com.lionparcel.services.consumer
${app_activity}    com.lionparcel.services.consumer.view.splash.BrandingActivity
${automation_name}    UiAutomator2

${time_out_element_visible}     20s
${privacy_policy_list_xpath_id}     com.lionparcel.services.consumer:id/llListItem
${disagree_button_xpath_id}     com.lionparcel.services.consumer:id/btnDisagree
${agree_button_xpath_id}        com.lionparcel.services.consumer:id/btnAgree

${title_xpath_id}     com.lionparcel.services.consumer:id/txtTitle
${message_xpath_id}    com.lionparcel.services.consumer:id/txtMessage
${ads_view_xpath}     //androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup
${register_button_xpath_id}     com.lionparcel.services.consumer:id/btnRegister
${login_button_xpath_id}     com.lionparcel.services.consumer:id/btnLogin
${sign_in_google_button_xpath_id}     com.lionparcel.services.consumer:id/clGoogle
${skip_button_xpath_id}     com.lionparcel.services.consumer:id/txtSkip
${skip_button_text_should_be}     Lanjutkan Tanpa Akun


*** Keywords ***
User Open Lion Parcel App Home Page
     open application    ${remote_url}    automationName=${automation_name}    platformName=${plaftorm_name}    platformVersion=${platform_version}    deviceName=${device_name}    appPackage=${app_package}    appActivity=${app_activity}

User Will Be Redirected To Login Page And Pop Up Privacy Policy Appear
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${privacy_policy_list_xpath_id}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${disagree_button_xpath_id}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${agree_button_xpath_id}

User Click Agree Button in Privacy Policy Pop Up
    AppiumLibrary.click element    id=${agree_button_xpath_id}
    sleep    2s

Pop Up Privacy Policy Will Be Disappear And Login Page Will Be Loaded
    #APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    xpath=${ads_view_xpath}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${register_button_xpath_id}       ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${login_button_xpath_id}      ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${sign_in_google_button_xpath_id}     ${time_out_element_visible}
    APPIUMLIBRARY.WAIT UNTIL ELEMENT IS VISIBLE    id=${skip_button_xpath_id}       ${time_out_element_visible}
    ${skip_button_text}=    Get Text    id=${skip_button_xpath_id}
    should be equal as strings    ${skip_button_text}     ${skip_button_text_should_be}

User Click Continue Without Account
    AppiumLibrary.click element    id=${skip_button_xpath_id}
    sleep    7s


