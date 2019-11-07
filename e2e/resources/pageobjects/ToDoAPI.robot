*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  HttpLibrary.HTTP

*** Variables ***

*** Keywords ***

Create Item
    [Documentation]  Add item via API
    [Arguments]  ${UserData}

    RequestsLibrary.Create Session  hook  ${URL.${ENVIRONMENT}}  verify=${True}
    ${body} =  Create Dictionary  data...
    ${headers} =  Create Dictionary  Content-Type=application/x-www-form-urlencoded
    ${resp} =  RequestsLibrary.Post Request  hook  todo/  data=${body}  headers=${headers}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${ref} =  evaluate  $resp.json().get("index number...")
    Log  ${ref}
    Set Global Variable  ${ref}

Edit Item
    [Documentation]  Edit item via API
    [Arguments]  ${UserData}

    RequestsLibrary.Create Session  hook  ${URL.${ENVIRONMENT}}  verify=${True}
    ${body} =  Create Dictionary  data...
    ${headers} =  Create Dictionary  Content-Type=application/x-www-form-urlencoded
    ${resp} =  RequestsLibrary.Post Request  hook  todo/edit/0  data=${body}  headers=${headers}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${ref} =  evaluate  $resp.json().get("index number...")
    Log  ${ref}
    Set Global Variable  ${ref}

Delete Item
    [Documentation]  Delete item via API
    [Arguments]  ${UserData}

    RequestsLibrary.Create Session  hook  ${URL.${ENVIRONMENT}}  verify=${True}
    ${body} =  Create Dictionary  data...
    ${headers} =  Create Dictionary  headers...
    ${resp} =  RequestsLibrary.Get Request  hook  todo/delete/0  data=${body}  headers=${headers}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${ref} =  evaluate  $resp.json().get("index number...")
    Log  ${ref}
    Set Global Variable  ${ref}

    #RequestsLibrary.Create Session  delete  https://${URL}/booking/${booking_ref}  verify=${True}
    #${headers} =  Create Dictionary  Authorization=Basic YWRtaW46cGFzc3dvcmQxMjM=  Accept=*/*
    #${resp} =  RequestsLibrary.Delete Request  delete  /booking/${booking_ref}  headers=${headers}
    #Should Be Equal As Strings  ${resp.status_code}  200