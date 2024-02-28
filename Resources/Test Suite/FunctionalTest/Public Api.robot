*** Settings ***
Documentation    Post request for Lumoa Public API validating sentiment and feebback in target collection
Library   RequestsLibrary
Library   Collections
Library   JSONLibrary
Library   BuiltIn
Library   OperatingSystem
Resource  ../../../SurveyPage_Test/config.resource


*** Variables ***
${baseUrl}=  https://stage-feedback-api.lumoa.me/

*** Keywords ***
Read JSON File
    [Documentation]         Reads JSON file and converts it to dictionary
    [Arguments]             ${file}
    ${json_file}            Get File   ${file}
    ${json_file}            Evaluate   json.loads('''${json_file}''')    json
    RETURN                  ${json_file}

*** Test Cases ***
Post Request
    [Tags]      PostFeedback
    #Specifies the number of iterations for each test loop where range is number (n)
    FOR  ${index}  IN RANGE  1
    Create Session  openended  ${baseUrl}  verify=true
    ${data}=  create dictionary  Authorization=${bearerToken2}  Accept=application/json  Content-Type=application/json
    ${body}  Read JSON File  TestSuite/FunctionalTest/Json_Files/postrequest.json
    ${response}=  POST On Session  openended  api/v1/feedback  json=${body}  headers=${data}
    Status Should Be  200  ${response}
    log to console   ${response.content}

#Assert valid Response Json
    log to console   ${response.json}
    Status Should Be   200

#Validate feedback in response
    ${body}=  Convert to String  ${response.content}
    Should Contain  ${body}   "comment":"I called your help desk and I was baffled by the poor experience, your app is very slow and integration is super slow and banking services is piss pooer"
    Status Should Be  200
    log to console  ${response}

#Validate feedback in response
    ${body}=  Convert to String  ${response.content}
    Should Contain  ${body}   "score":"6"
    Status Should Be  200
    log to console  ${response}

   END

Get Topic Impacts Request
    [Tags]      GetImpacts
    Create Session  impacts  ${baseUrl}  verify=true
    ${data}=  create dictionary  Authorization=${bearerToken}   Accept=application/json  Content-Type=application/json
    ${body}  Read JSON File  TestSuite/FunctionalTest/Json_Files/postrequest.json
    ${response}=  Get On Session  impacts  api/v1/feedback/impacts/1300  json=${body}  headers=${data}
    Status Should Be  200  ${response}
    log to console   ${response.content}

#Validate Score
    ${body}=  Convert to String  ${response.content}
    Should Contain  ${body}   "score":3.2
    Status Should Be  200
    log to console  ${response}

#Validate Scorenegative
    ${body}=  Convert to String  ${response.content}
    Should Contain  ${body}   "scoreNegative":49
    Status Should Be  200
    log to console  ${response}

#Validate Scorepositive
    ${body}=  Convert to String  ${response.content}
    Should Contain  ${body}   "scorePositive":61
    Status Should Be  200
    log to console  ${response}

Put Request       #Enrich Tag with Write Token
    [Tags]      EnrichAPI
    Create Session  putrequest  ${baseUrl}  verify=true
    ${data}=  create dictionary  Authorization=${bearerToken2}   Accept=application/json  Content-Type=application/json
    ${body}  Read JSON File  TestSuite/FunctionalTest/Json_Files/enrichedToken.json
    ${response}=  put on session  putrequest  url=api/v1/feedback?SkipIfExist=true  json=${body}  headers=${data}
    Status Should Be  200  ${response}
    log to console   ${response.content}

#Assert valid Response Json
    log to console   ${response.json}
    Status Should Be   200

#Validate Valid Tag in response
    ${body}=  Convert to String  ${response.content}
    Should Contain  ${body}  "name":"country","value":"api tests"
    Status Should Be  200
    log to console  ${response}

#Validate Valid Tag in response
    ${body}=  Convert to String  ${response.content}
    Should Contain  ${body}  "name":"brand","value":"lumoa api"
    Status Should Be  200
    log to console  ${response}


Get feedback
     [Tags]      GetFeedback
    Create Session  feedback  ${baseUrl}  verify=true
    ${data}=  create dictionary  Authorization=${bearerToken}   Accept=application/json  Content-Type=application/json
    ${body}  Read JSON File  TestSuite/FunctionalTest/Json_Files/postrequest.json
    ${response}=  Get On Session  feedback  url=api/v1/feedback/?startDate=2017-09-01&endDate=2021-12-21&offset=0&limit=100  json=${body}  headers=${data}
    Status Should Be  200  ${response}
    log to console   ${response.content}

#Assert valid Response Json
    log to console   ${response.json}
    Status Should Be   200

#Validate Valid Integration Source
    ${body}=  Convert to String  ${response.content}
    Should Contain  ${body}  "name":"source","value":"play"
    Status Should Be  200
    log to console  ${response}

#Validate Valid response comment
    ${body}=  Convert to String  ${response.content}
    Should Contain  ${body}  "comment":"How do I create account Because this is my first time of using it"
    Status Should Be  200
    log to console  ${response}

#Validate Valid Value
    ${body}=  Convert to String  ${response.content}
    Should Contain  ${body}  {"name":"rec revenue","value":"19973"}
    Status Should Be  200
    log to console  ${response}

#Validate Reviewer ID
    ${body}=  Convert to String  ${response.content}
    Should Contain  ${body}  {"name":"reviewer_name","value":"omelaja qudus"}
    Status Should Be  200
    log to console  ${response}

