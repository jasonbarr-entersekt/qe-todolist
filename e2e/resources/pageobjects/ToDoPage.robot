*** Settings ***
Library  BuiltIn
Library  SeleniumLibrary

*** Variables ***
${header} =  css:h1
${update_btn} =  name:edittodo
${inputfield} =  name:newtodo
${submit_btn} =  id:new-submit

*** Keywords ***

Assert Page Loaded
    Wait Until Element Is Visible  ${header}
    Wait Until Element Is Visible  ${inputfield}

Enter ToDo Name
    Input Text  ${inputfield}  random

Click Submit
    Click Element  ${submit_btn}

Click Update
    Click Element  ${update_btn}