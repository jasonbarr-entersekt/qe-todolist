*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
#Library  XvfbRobot

*** Variables ***

*** Keywords ***
Begin Web Test
    #Start Virtual Display  1920  1080
    Go Headless
    Open Browser  ${URL.${ENVIRONMENT}}  ${BROWSER}  desired_capabilities=${GC_OPTIONS}
    Maximize Browser Window

Go Headless

    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox

    ${GC_OPTIONS} =     Call Method     ${chrome_options}    to_capabilities    
    Set Global Variable  ${GC_OPTIONS}

End Web Test
    Close All Browsers
