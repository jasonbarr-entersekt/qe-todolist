*** Settings ***
Resource  ../resources/pageobjects/ToDoPage.robot
Resource  ../resources/pageobjects/ToDoAPI.robot

*** Variables ***

*** Keywords ***

Add Item
    [Documentation]  Create a valid item.
    [Arguments]  ${UserData}

Add Duplicate Item
    [Documentation]  Add duplicate item.
    [Arguments]  ${UserData}

Edit Item
    [Documentation]  Edit todolist item.

Delete Item
    [Documentation]  Delete item.
    ToDoPage.Delete Record

API Add Item
    [Documentation]  Shortcut the UI and add item via api call.
    [Arguments]  ${UserData}

    ToDoAPI.Create Record  ${UserData}

API Edit Item
    [Documentation]  Shortcut the UI and edit item via api call.
    [Arguments]  ${UserData}

    ToDoAPI.Create Record  ${UserData}

API Delete Item
    [Documentation]  Shortcut the UI and delete item via api call.
    [Arguments]  ${UserData}

    ToDoAPI.Create Record  ${UserData}

Assert Record Added
    [Documentation]  Assert that todo item was added.
    [Arguments]  ${UserData}
