*** Settings ***
Library     Collections
Library     RequestsLibrary

*** Variables ***
${base_url}     https://reqres.in
${user_id}      3
${end_point}     /api
${get_reponse}
${email}        emma.wong@reqres.in
${first_name}   Emma
${last_name}    Wong
${avatar}       https://reqres.in/img/faces/3-image.jpg
${url}       https://reqres.in/#support-heading
${text}       To keep ReqRes free, contributions towards server costs are appreciated!
@{data_fields}     id   email   first_name  last_name   avatar
@{support_fiels}     url   text

*** Keywords ***
Hit API Get Single Users With Valid ID
    ${get_reponse}=     GET     ${base_url}${end_point}/users/${user_id}
    set global variable    ${get_reponse}

Response Should Have Status 200
    status should be    200

Response Should Contains Some Keys
    # assert if json response of data contains some fields
    FOR    ${index}    ${item}    IN ENUMERATE    @{data_fields}
        should contain match    ${get_reponse.json()}[data]    ${item}
    END

    # assert if json response of support contains some fields
    FOR    ${index}    ${item}    IN ENUMERATE    @{support_fiels}
        should contain match    ${get_reponse.json()}[support]    ${item}
    END

Response Should Have Correct Value
    should be equal as strings    ${user_id}        ${get_reponse.json()}[data][id]
    should be equal as strings    ${email}        ${get_reponse.json()}[data][email]
    should be equal as strings    ${first_name}        ${get_reponse.json()}[data][first_name]
    should be equal as strings    ${last_name}        ${get_reponse.json()}[data][last_name]
    should be equal as strings    ${avatar}        ${get_reponse.json()}[data][avatar]
    should be equal as strings    ${url}        ${get_reponse.json()}[support][url]
    should be equal as strings    ${text}        ${get_reponse.json()}[support][text]