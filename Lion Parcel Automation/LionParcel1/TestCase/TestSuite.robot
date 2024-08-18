*** Settings ***
Library     OperatingSystem
Library    AppiumLibrary

*** Variables ***
# App Config
${remoteurl}=           	        http://127.0.0.1:4723
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
${closeSlideShow}=                  //android.widget.ImageView[@resource-id="com.lionparcel.services.consumer:id/ivClose"]
${closepopup1}=                     //android.widget.ImageView[@resource-id="com.lionparcel.services.consumer:id/ivClose"]
${RouteSearch1}=                    //android.widget.EditText[@resource-id="com.lionparcel.services.consumer:id/edtRouteSearch"]
${destinationAddress}=              //android.widget.EditText[@resource-id="com.lionparcel.services.consumer:id/edtDestinationAddress"]
${originAddress}=                   //android.widget.EditText[@resource-id="com.lionparcel.services.consumer:id/edtOriginAddress"]
${checkTarifmenu}=                  (//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[6]
${checkTarifCTA}=                   //android.widget.Button[@resource-id="com.lionparcel.services.consumer:id/btnCheckTariff"]
${totalPayment}=                    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtTotalTariffEstimation"]
${massTextField}=                   //android.widget.EditText[@resource-id="com.lionparcel.services.consumer:id/edtTotalWeight"]
${zeroMassErrorMessage}=            //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/textinput_helper_text"]
${totalWeight}=                     //android.widget.EditText[@resource-id="com.lionparcel.services.consumer:id/edtTotalWeight"]
${pengirimanJumboPack}=             (//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[6]





*** Test Cases ***
General Test Case
    Open application    ${remoteurl}    platformName=${platformName}   platformVersion=${platform_version}     deviceName=${deviceName}   appPackage=${appPackage}
    ...     automationName=${automationName}   noReset=true     doesNoReset=true   appActivity=${appActivity}
    ${close_btn_present}    Run keyword and return status    Page should contain element   ${closepopup1}
    Sleep       1
    Run keyword if    ${close_btn_present}
    ...     Click element    ${closepopup1}
    Click element    xpath=(//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[6]
    Wait until element is visible    ${originAddress}
    Click element    ${originAddress}
    Wait until element is visible    ${RouteSearch1}
    Click element   ${RouteSearch1}
    Input text    ${RouteSearch1}       Kebon Jeruk
    Wait until element is visible  //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName"]
    Click element    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName"]
    Wait until element is visible    ${destinationAddress}
    Click element    ${destinationAddress}
    Wait until element is visible    ${RouteSearch1}
    Click element    ${RouteSearch1}
    Input text    ${RouteSearch1}       Mampang
    Wait until element is visible    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtDistrictRouteName"]
    Click element       //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtDistrictRouteName"]
    Wait until element is visible    ${checkTarifCTA}
    Click element    ${checkTarifCTA}
    Wait until element is visible    ${totalWeight}
    Swipe   527     1961    552     421
    Wait until element is visible    ${totalPayment}
    ${bussPackTarif}=    Set variable    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtEstimatedPrice" and @text="Rp7.500"]
    ${estimatedpaymenttext}=    Get text    ${totalPayment}
    ${bussPackPrice}=       Get text    ${bussPackTarif}
    Should be equal as strings   ${estimatedpaymenttext}        ${bussPackPrice}
    Close application

Change Berat
    Open application    ${remoteurl}    platformName=${platformName}   platformVersion=${platform_version}     deviceName=${deviceName}   appPackage=${appPackage}
    ...     automationName=${automationName}    autoLaunch=true     noReset=true    appActivity=${appActivity}
    ${close_btn_present}    Run keyword and return status    Page should contain element   ${closepopup1}
    Sleep       1
    Run keyword if    ${close_btn_present}
    ...     Click element    ${closepopup1}
    Click element    xpath=(//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[6]
    Wait until element is visible    ${originAddress}
    Click element    ${originAddress}
    Wait until element is visible    ${RouteSearch1}
    Click element   ${RouteSearch1}
    Input text    ${RouteSearch1}       Kebon Jeruk
    Wait until element is visible  //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName"]
    Click element    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName"]
    Wait until element is visible    ${destinationAddress}
    Click element    ${destinationAddress}
    Wait until element is visible    ${RouteSearch1}
    Click element    ${RouteSearch1}
    Input text    ${RouteSearch1}       Mampang
    Wait until element is visible    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtDistrictRouteName"]
    Click element       //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtDistrictRouteName"]
    Wait until element is visible    ${checkTarifCTA}
    Click element    ${checkTarifCTA}
    Wait until element is visible    ${totalWeight}
    Swipe   527     1961    552     421
    Wait until element is visible    ${totalPayment}
    ${bussPackTarif}=    Set variable    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtEstimatedPrice" and @text="Rp7.500"]
    ${busspackTarif5kg}=    Set variable    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtEstimatedPrice" and @text="Rp37.500"]
    ${estimatedpaymenttext}=    Get text    ${totalPayment}
    ${bussPackPrice}=       Get text    ${bussPackTarif}
    Should be equal as strings   ${estimatedpaymenttext}        ${bussPackPrice}
    Swipe    552    421     527     1961
    Wait until element is visible    ${totalWeight}
    Click element    ${totalWeight}
    Hide keyboard
    Input text    ${totalWeight}        5
    Swipe   527     1961    552     421
    ${estimatedpaymenttext}=    Get text    ${totalPayment}
    ${bussPackPrice5kg}=       Get text    ${bussPackTarif5kg}
    Should be equal as strings   ${estimatedpaymenttext}        ${bussPackPrice5kg}
    Close application

Change Jenis Pengiriman
    Open application    ${remoteurl}    platformName=${platformName}   platformVersion=${platform_version}     deviceName=${deviceName}   appPackage=${appPackage}
    ...     automationName=${automationName}    noReset=true    doesNoReset=true    appActivity=${appActivity}
    ${close_btn_present}    Run keyword and return status    Page should contain element   ${closepopup1}
    Sleep       1
    Run keyword if    ${close_btn_present}
    ...     Click element    ${closepopup1}
    Click element    xpath=(//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[6]
    Wait until element is visible    ${originAddress}
    Click element    ${originAddress}
    Wait until element is visible    ${RouteSearch1}
    Click element   ${RouteSearch1}
    Input text    ${RouteSearch1}       Kebon Jeruk
    Wait until element is visible  //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName"]
    Click element    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName"]
    Wait until element is visible    ${destinationAddress}
    Click element    ${destinationAddress}
    Wait until element is visible    ${RouteSearch1}
    Click element    ${RouteSearch1}
    Input text    ${RouteSearch1}       Mampang
    Wait until element is visible    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtDistrictRouteName"]
    Click element       //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtDistrictRouteName"]
    Wait until element is visible    ${checkTarifCTA}
    Click element    ${checkTarifCTA}
    Wait until element is visible    ${totalWeight}
    Swipe   527     1961    552     421
    Wait until element is visible    ${totalPayment}
    ${bussPackTarif}=    Set variable    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtEstimatedPrice" and @text="Rp7.500"]
    ${busspackTarif5kg}=    Set variable    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtEstimatedPrice" and @text="Rp37.500"]
    ${estimatedpaymenttext}=    Get text    ${totalPayment}
    ${bussPackPrice}=       Get text    ${bussPackTarif}
    Should be equal as strings   ${estimatedpaymenttext}        ${bussPackPrice}
    Click element    xpath=(//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[6]
    ${jumboPackTarif}=      Set variable    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtEstimatedPrice" and @text="Rp78.000"]
    ${jumboPackPrice}=      Get text    ${jumboPackTarif}
    ${estimatedpaymenttext}=    Get text    ${totalPayment}
    Should be equal as strings   ${estimatedpaymenttext}        ${jumboPackPrice}
    Close application

Change Asal
    Open application    ${remoteurl}    platformName=${platformName}   platformVersion=${platform_version}     deviceName=${deviceName}   appPackage=${appPackage}
    ...     automationName=${automationName}    noReset=true    doesNoReset=true    appActivity=${appActivity}
    ${close_btn_present}    Run keyword and return status    Page should contain element   ${closepopup1}
    Sleep       1
    Run keyword if    ${close_btn_present}
    ...     Click element    ${closepopup1}
    Click element    xpath=(//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[6]
    Wait until element is visible    ${originAddress}
    Click element    ${originAddress}
    Wait until element is visible    ${RouteSearch1}
    Click element   ${RouteSearch1}
    Input text    ${RouteSearch1}       Kebon Jeruk
    Wait until element is visible  //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName"]
    Click element    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName"]
    Wait until element is visible    ${destinationAddress}
    Click element    ${destinationAddress}
    Wait until element is visible    ${RouteSearch1}
    Click element    ${RouteSearch1}
    Input text    ${RouteSearch1}       Mampang
    Wait until element is visible    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtDistrictRouteName"]
    Click element       //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtDistrictRouteName"]
    Wait until element is visible    ${checkTarifCTA}
    Click element    ${checkTarifCTA}
    Wait until element is visible    ${totalWeight}
    Swipe   527     1961    552     421
    Wait until element is visible    ${totalPayment}
    ${bussPackTarif}=    Set variable    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtEstimatedPrice" and @text="Rp7.500"]
    ${busspackTarif5kg}=    Set variable    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtEstimatedPrice" and @text="Rp37.500"]
    ${estimatedpaymenttext}=    Get text    ${totalPayment}
    ${bussPackPrice}=       Get text    ${bussPackTarif}
    Should be equal as strings   ${estimatedpaymenttext}        ${bussPackPrice}
    Swipe    552    421     527     1961
    Wait until element is visible    ${originAddress}
    Click element    ${originAddress}
    Click element    ${RouteSearch1}
    Input text      ${RouteSearch1}     Bekasi Barat
    Wait until element is visible  //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName"]
    Click element    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName"]
    Swipe   527     1961    552     421
    Wait until element is visible    ${totalPayment}
    ${bussPackTarif}=    Set variable    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtEstimatedPrice" and @text="Rp7.500"]
    ${busspackTarif5kg}=    Set variable    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtEstimatedPrice" and @text="Rp37.500"]
    ${estimatedpaymenttext}=    Get text    ${totalPayment}
    ${bussPackPrice}=       Get text    ${bussPackTarif}
    Should be equal as strings   ${estimatedpaymenttext}        ${bussPackPrice}
    Close Application
Change Destination
    Open application    ${remoteurl}    platformName=${platformName}   platformVersion=${platform_version}     deviceName=${deviceName}   appPackage=${appPackage}
    ...     automationName=${automationName}    noReset=true    doesNoReset=true    appActivity=${appActivity}
    ${close_btn_present}    Run keyword and return status    Page should contain element   ${closepopup1}
    Sleep       1
    Run keyword if    ${close_btn_present}
    ...     Click element    ${closepopup1}
    Click element    xpath=(//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[6]
    Wait until element is visible    ${originAddress}
    Click element    ${originAddress}
    Wait until element is visible    ${RouteSearch1}
    Click element   ${RouteSearch1}
    Input text    ${RouteSearch1}       Kebon Jeruk
    Wait until element is visible  //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName"]
    Click element    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName"]
    Wait until element is visible    ${destinationAddress}
    Click element    ${destinationAddress}
    Wait until element is visible    ${RouteSearch1}
    Click element    ${RouteSearch1}
    Input text    ${RouteSearch1}       Mampang
    Wait until element is visible    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtDistrictRouteName"]
    Click element       //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtDistrictRouteName"]
    Wait until element is visible    ${checkTarifCTA}
    Click element    ${checkTarifCTA}
    Wait until element is visible    ${totalWeight}
    Swipe   527     1961    552     421
    Wait until element is visible    ${totalPayment}
    ${bussPackTarif}=    Set variable    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtEstimatedPrice" and @text="Rp7.500"]
    ${busspackTarif5kg}=    Set variable    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtEstimatedPrice" and @text="Rp37.500"]
    ${estimatedpaymenttext}=    Get text    ${totalPayment}
    ${bussPackPrice}=       Get text    ${bussPackTarif}
    Should be equal as strings   ${estimatedpaymenttext}        ${bussPackPrice}
    Swipe    552    421     527     1961
    Wait until element is visible    ${destinationAddress}
    Click element    ${destinationAddress}
    Click element    ${RouteSearch1}
    Input text      ${RouteSearch1}     Bekasi Barat
    Wait until element is visible    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtDistrictRouteName"]
    Click element       //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtDistrictRouteName"]
    Swipe   527     1961    552     421
    Wait until element is visible    ${totalPayment}
    ${bussPackTarif}=    Set variable    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtEstimatedPrice" and @text="Rp7.500"]
    ${busspackTarif5kg}=    Set variable    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtEstimatedPrice" and @text="Rp37.500"]
    ${estimatedpaymenttext}=    Get text    ${totalPayment}
    ${bussPackPrice}=       Get text    ${bussPackTarif}
    Should be equal as strings   ${estimatedpaymenttext}        ${bussPackPrice}
    Close application

Negative Test Case Both asal and tujuan Null
    Open application    ${remoteurl}    platformName=${platformName}   platformVersion=${platform_version}     deviceName=${deviceName}   appPackage=${appPackage}
    ...     automationName=${automationName}    noReset=true    doesNoReset=true    appActivity=${appActivity}
    ${close_btn_present}    Run keyword and return status    Page should contain element   ${closepopup1}
    Sleep       1
    Run keyword if    ${close_btn_present}
    ...     Click element    ${closepopup1}
    Click element    xpath=(//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[6]
    Wait until element is visible    ${originAddress}
    ${cekTarif_is_disabled}=        Run keyword and return status    Element should be enabled      ${checkTarifCTA}
    Should not be true      ${cekTarif_is_disabled}
    Close application

Negative Test Case tujuan tidak diisi
    Open application    ${remoteurl}    platformName=${platformName}   platformVersion=${platform_version}     deviceName=${deviceName}   appPackage=${appPackage}
    ...     automationName=${automationName}    noReset=true    doesNoReset=true    appActivity=${appActivity}
    ${close_btn_present}    Run keyword and return status    Page should contain element   ${closepopup1}
    Sleep       1
    Run keyword if    ${close_btn_present}
    ...     Click element    ${closepopup1}
    Click element    xpath=(//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[6]
    Wait until element is visible    ${originAddress}
    Click element    ${originAddress}
    Wait until element is visible    ${RouteSearch1}
    Click element   ${RouteSearch1}
    Input text    ${RouteSearch1}       Kebon Jeruk
    Wait until element is visible  //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName"]
    Click element    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName"]
    Wait until element is visible    ${checkTarifCTA}
    ${cekTarif_is_disabled}=        Run keyword and return status    Element should be enabled      ${checkTarifCTA}
    Should not be true      ${cekTarif_is_disabled}
    Close application
Negative test case berat = 0
    Open application    ${remoteurl}    platformName=${platformName}   platformVersion=${platform_version}     deviceName=${deviceName}   appPackage=${appPackage}
    ...     automationName=${automationName}    noReset=true    doesNoReset=true    appActivity=${appActivity}
    ${close_btn_present}    Run keyword and return status    Page should contain element   ${closepopup1}
    Sleep       1
    Run keyword if    ${close_btn_present}
    ...     Click element    ${closepopup1}
    Click element    xpath=(//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[6]
    Wait until element is visible    ${originAddress}
    Click element    ${originAddress}
    Wait until element is visible    ${RouteSearch1}
    Click element   ${RouteSearch1}
    Input text    ${RouteSearch1}       Kebon Jeruk
    Wait until element is visible  //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName"]
    Click element    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName"]
    Wait until element is visible    ${destinationAddress}
    Click element    ${destinationAddress}
    Wait until element is visible    ${RouteSearch1}
    Click element    ${RouteSearch1}
    Input text    ${RouteSearch1}       Mampang
    Wait until element is visible    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtDistrictRouteName"]
    Click element       //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtDistrictRouteName"]
    Wait until element is visible    ${checkTarifCTA}
    Click element    ${checkTarifCTA}
    Wait until element is visible    ${totalWeight}
    Click element    ${totalWeight}
    Input text    ${totalWeight}       0
    Hide keyboard
    Wait until element is visible    ${zeroMassErrorMessage}
    Close application

Negative test case berat = null
    Open application    ${remoteurl}    platformName=${platformName}   platformVersion=${platform_version}     deviceName=${deviceName}   appPackage=${appPackage}
    ...     automationName=${automationName}    noReset=true    doesNoReset=true    appActivity=${appActivity}
    ${close_btn_present}    Run keyword and return status    Page should contain element   ${closepopup1}
    Sleep       1
    Run keyword if    ${close_btn_present}
    ...     Click element    ${closepopup1}
    Click element    xpath=(//android.widget.ImageView[@content-desc="Ini merupakan sebuah gambar"])[6]
    Wait until element is visible    ${originAddress}
    Click element    ${originAddress}
    Wait until element is visible    ${RouteSearch1}
    Click element   ${RouteSearch1}
    Input text    ${RouteSearch1}       Kebon Jeruk
    Wait until element is visible  //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName"]
    Click element    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtOriginRouteName"]
    Wait until element is visible    ${destinationAddress}
    Click element    ${destinationAddress}
    Wait until element is visible    ${RouteSearch1}
    Click element    ${RouteSearch1}
    Input text    ${RouteSearch1}       Mampang
    Wait until element is visible    //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtDistrictRouteName"]
    Click element       //android.widget.TextView[@resource-id="com.lionparcel.services.consumer:id/txtDistrictRouteName"]
    Wait until element is visible    ${checkTarifCTA}
    Click element    ${checkTarifCTA}
    Wait until element is visible    ${totalWeight}
    Click element    ${totalWeight}
    Clear text    ${totalWeight}
    Hide keyboard
    Wait until element is visible    ${zeroMassErrorMessage}
    Close application