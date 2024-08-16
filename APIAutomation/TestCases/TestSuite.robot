*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem
Resource    Keywords.robot


*** Variables ***
${base_url}     https://reqres.in/api
${header}    Content-Type=application/json
${name}    morpheus
${job}    leader
${endpoint}    /users

***Test Cases***
get single valid user
#    Given Reqres API is available
#    When I retrieve user with ID 4
#    Then Response status code must be 200   ${response}
#    And The user email should be "eve.holt@reqres.in"    ${response_json}

     Create Session    mysession    ${base_url}
    ${response}=      GET On Session     mysession    /users/4
    Should Be Equal As Numbers    ${response.status_code}    200
    ${response_json}=    Convert To Dictionary    ${response.json()}
    ${email}=        Get From Dictionary    ${response_json['data']}    email
    Log    ${email}
    Should Be Equal    ${email}    eve.holt@reqres.in

get single invalid User
#    Given Reqres API is available
#    When I retrieve user with ID 100
#    Then Response status code must be 404   {response}
    Create Session   mysession   ${base_url}
    ${response} =     GET    ${base_url}/users/100    expected_status=404

create user
#     Given Reqres API is available
#     When
    Create Session    mysession    ${base_url}
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${body}=    Create Dictionary    name=morpheus    job=leader
    ${response}=    Post Request    mysession    ${ENDPOINT}    json=${body}    headers=${headers}
    ${code}=    Convert To String     ${response.status_code}
    Should Be Equal    ${code}    201
    ${body}=    Convert To String    ${response.content}
    Should Contain    ${body}    morpheus
