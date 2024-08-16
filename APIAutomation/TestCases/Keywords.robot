*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem
Resource    Var.robot

*** Keywords ***
Reqres API is available
    Create Session    mysession    ${base_url}
I retrieve user with ID 4
    ${response}=      GET On Session     mysession    /users/4

I retrieve user with ID 100
    ${response}=    GET On Session  mysession   /users/100

Response status code must be 404
    [Arguments]     ${response}
    ${response} =     Should Be Equal As Numbers   ${response.404_status_code}  expected_status=404


Response status code must be 200
    [Arguments]     ${response}
    Should Be Equal As Numbers    ${response.success_status_code}    200
The user email should be "eve.holt@reqres.in"
    [Arguments]     ${response}
    ${response_json}=    Convert To Dictionary    ${response.json()}
    Log    ${response_json}
    ${email}=        Get From Dictionary    ${response_json['data']}    email
    Log    ${email}
    Should Be Equal    ${email}    eve.holt@reqres.in

I create user Morpheus and his job

The response status code should be 201
