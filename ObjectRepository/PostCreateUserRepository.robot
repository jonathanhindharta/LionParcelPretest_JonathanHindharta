*** Settings ***
Library     Collections
Library     RequestsLibrary
Library    DateTime

*** Variables ***
${base_url}     https://reqres.in
${end_point}     /api/users
${post_reponse}
${name}         Jonathan
${job}          Software Tester
@{response_fields}     name   job   id  createdAt

*** Keywords ***
Post Created User With Name And Job Filled
    ${req_body}=    create dictionary    name=${name}    job=${job}
    ${post_reponse}=     POST     ${base_url}${end_point}       json=${req_body}
    set global variable    ${post_reponse}

Response Should Have Status 201
    status should be    201

Response Should Contains Some Keys
    # assert if json response of data contains some fields
    FOR    ${index}    ${item}    IN ENUMERATE    @{response_fields}
        should contain match    ${post_reponse.json()}    ${item}
    END

Response Should Have Correct Value
    ${current_date}=    Get Current Date    result_format=%Y-%m-%d
    should be equal as strings    ${name}        ${post_reponse.json()}[name]
    should be equal as strings    ${job}        ${post_reponse.json()}[job]
    should not be empty    ${post_reponse.json()}[id]
    should contain    ${post_reponse.json()}[createdAt]     ${current_date}
