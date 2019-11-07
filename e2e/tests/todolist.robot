*** Settings ***
Documentation  This is a suite of tests for the Equal Experts demo site.

Resource  ../data/ToDoList.robot  # Resouce file for input data.
Resource  ../resources/common.robot  # Resource file for common test actions.
Resource  ../resources/keywords.robot  # Resource file for keywords referenced by the test cases.

Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***

*** Test Cases ***

Add a new todolist item
    [Documentation]  Create item.
    [Tags]  ready

Add todolist item with empty name
    [Documentation]  Create item.
    [Tags]  ready

Edit todolist item
    [Documentation]  Edit item name.
    [Tags]  ready

Edit todolist item to empty name.
    [Documentation]  Create item.
    [Tags]  ready

Delete todolist item
    [Documentation]  Delete item.
    [Tags]  wip

Create item via the API and check item visible on the front-end
    [Documentation]  Submit API request and validate front-end.
    [Tags]  wip  api

Delete a booking via the API and assert not visible on the front-end
    [Documentation]  Submit API request and validate front-end.
    [Tags]  wip  api

Navigate to randompage and ensure redirected to /todo
    [Documentation]  Create item.
    [Tags]  ready

Navigate to non-existent item and ensure redirected to /todo
    [Documentation]  Create item.
    [Tags]  ready

Throw some naughty strings at todolist
    [Documentation]  Create item.
    [Tags]  ready
    [Template]  Naughty Strings

Create item name with multiple space
    [Documentation]  Create item.
    [Tags]  ready