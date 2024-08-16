*** Settings ***
Library     OperatingSystem
Library    AppiumLibrary

*** Variables ***
# App Config
${remoteurl}=           	        http://0.0.0.0:4723
${platformName}=                    Android
${platformVersion}=                 14
${deviceName}=                      emulator-5554
${automationName}=                  UiAutomator2
${appPackage}=                      com.lionparcel.services.consumer
${appActivity}=                     .view.splash.BrandingActivity

# App Elements
${appNotificationPermissionCTA}=    //android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_button"]
${loginAsGuestCTA}=                 //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtSkip"]
${PrivacyPolicyCTA}=                //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/btnAgree"]

*** Keywords ***

*** Test Cases ***
Start
    Open Application    ${remoteurl}    platformName=${platformName}   platformVersion=${platform_version}     deviceName=${deviceName}   appPackage=${appPackage}
    ...     automationName=${automationName}    noReset=false    doesNoReset=true    appActivity=${appActivity}
    Wait until element is visible  ${appNotificationPermissionCTA}
    Click element    ${appNotificationPermissionCTA}

    Wait until element is visible   ${PrivacyPolicyCTA}  10
    ${text_present}=    Run Keyword And Return Status    Page Should Contain Text    Setuju
    Run Keyword If    ${text_present}
    ...     Click Element    ${PrivacyPolicyCTA}

    Click Element    ${loginAsGuestCTA}

    Close application
#
#    # Home screen
#    Sleep   5
#    Click element    //android.widget.ImageView[@resource-id="com.lionparcel.services.consumer:id/ivClose"]
#    Click element    //android.widget.ImageView[@resource-id="com.lionparcel.services.consumer:id/imgClose"]
#
#    Click element    //android.widget.FrameLayout[@resource-id="com.lionparcel.services.consumer:id/hmtMenu"])[3]/android.view.ViewGroup
#    Click element    TEXTFIELD //android.widget.EditText[@resource-id="com.lionparcel.services.consumer:id/edtOriginAddress"]
