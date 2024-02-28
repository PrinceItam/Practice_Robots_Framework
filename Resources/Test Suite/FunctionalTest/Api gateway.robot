*** Settings ***
Documentation    Automation test for Lumoa Impact scores for NPS, Linear and OPEN_ENDED KPIs
...              Validating response numbers and different API endpoints and separate
...              MongoDB query getImpact and getMainScore
Library          RequestsLibrary
Library          Collections
Library          String
Library          OperatingSystem
Library          JSONLibrary
Library          BuiltIn
Suite Setup      set log level  DEBUG


*** Keywords ***
GET ADMIN TOKEN
   Create session  baseURL  https://stage-internal-api.lumoa.me  verify=${True}
   ${data}=  create dictionary  Content-Type=application/json
   ${body}=     Read JSON File    ${CURDIR}/Json_Files/bodyfile.json
   ${response}=  post on session  baseURL  /api/v2/auth    json=${body}   headers=${data}
   log to console  ${response.json().get("data").get("attributes").get("authToken")}
   log to console  ${response.status_code}
   ${accessToken}=  evaluate  $response.json().get("data").get("attributes").get("authToken")   #gets auth Token in json response
   ${token}=   catenate   ${accessToken}
   log to console    ${accessToken}
   [Return]   ${accessToken}

Read JSON File
    [Documentation]         Reads JSON file and converts it to dictionary
    [Arguments]             ${file}
    ${json_file}            Get File   ${file}
    ${json_file}            Evaluate   json.loads('''${json_file}''')    json
    RETURN                  ${json_file}

*** Test Cases ***

API GATEWAY NPS ENDPOINT
    [Tags]      NPS
    create session  nps  https://stage-internal-api.lumoa.me  verify=true
    ${json}       Read JSON File       ${CURDIR}/Json_Files/readfile.json
    ${body}      Read JSON File        ${CURDIR}/Json_Files/headerAPI.json
    ${accessToken}     GET ADMIN TOKEN
    ${headers4}=  create dictionary   Authorization=Bearer ${accessToken}  authority=stage-api.lumoa.me  accept=application/json, text/plain, */*
    ${resp}=  POST ON SESSION  nps  /api/v1/nps   headers=${headers4}   json=${json}
    Status Should Be  200  ${resp}
    #log to console  ${resp}

#Assert valid Response Json
   log to console  ${resp.json}
   Status Should Be  200

#Assert Valid Amount of total Feedback with comment
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "totalFeedbacks":3130,
    Status Should Be  200
    log to console  ${resp}

#Assert Valid Amount of total Feedback without comment
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "totalFeedbacksWithComment":1076
    Status Should Be  200
    log to console  ${resp}

API GATEWAY getFeedback ENDPOINT
    [Tags]      NPS
    create session  getFeedback  https://stage-internal-api.lumoa.me  verify=true
    ${json}       Read JSON File       ${CURDIR}/Json_Files/readfile.json
    ${body}      Read JSON File        ${CURDIR}/Json_Files/headerAPI.json
    ${accessToken}     GET ADMIN TOKEN
    ${headers4}=  create dictionary   Authorization=Bearer ${accesstoken}  authority=stage-api.lumoa.me  accept=application/json, text/plain, */*
    ${resp}=  POST ON SESSION  getFeedback   /api/v1/getFeedback    headers=${headers4}   json=${json}
    Status Should Be  200  ${resp}
    #log to console  ${resp}

#Assert valid Response Json
   log to console  ${resp.json}
   Status Should Be  200

#Validate Response Body
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "categorySet":"company.182.collection.367",
    Status Should Be  200
    log to console  ${resp}

#Validate amout of
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "externalId":"Gxxxx1293","score":10,
    Status Should Be  200
    log to console  ${resp}

#Validate Response body has defined Feedback
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "comment":"It does what it needs to. No problems with it, used it for months.",
    Status Should Be  200
    log to console  ${resp}

API GATEWAY FeedbackCount ENDPOINT
    [Tags]      NPS
    create session  feedbackCount  https://stage-internal-api.lumoa.me  verify=true
    ${json}       Read JSON File       ${CURDIR}/Json_Files/readfile.json
    ${body}      Read JSON File        ${CURDIR}/Json_Files/headerAPI.json
    ${accessToken}     GET ADMIN TOKEN
    ${headers4}=  create dictionary   Authorization=Bearer ${accesstoken}  authority=stage-api.lumoa.me  accept=application/json, text/plain, */*
    ${resp}=  POST ON SESSION  feedbackCount   /api/v1/feedbackCount    headers=${headers4}   json=${json}
    Status Should Be  200  ${resp}
    #log to console  ${resp}

#Assert valid Response Json
   log to console  ${resp.json}
   Status Should Be  200

#Validate feedback count on test topic 1
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "Access","feedback":36
    Status Should Be  200
    #log to console  ${resp}

#Validate feedback count on general topic
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "General","feedback":65
    Status Should Be  200
    #log to console  ${resp}

#Validate feedback count on test topic 2
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "Efficient","feedback":5
    Status Should Be  200
    log to console  ${resp}

#Validate feedback count on test topic 2
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "Technical quality","feedback":378
    Status Should Be  200
    log to console  ${resp}

#Validate total feedback amount
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "totalFeedbacks":1076
    Status Should Be  200
  #  log to console  ${resp}

API GATEWAY Insights ENDPOINT
    [Tags]      NPS
    create session  Insights  https://stage-internal-api.lumoa.me   verify=true
    ${json}       Read JSON File       ${CURDIR}/Json_Files/readfile.json
    ${body}      Read JSON File        ${CURDIR}/Json_Files/headerAPI.json
    ${accessToken}     GET ADMIN TOKEN
    ${headers4}=  create dictionary   Authorization=Bearer ${accesstoken}  authority=stage-api.lumoa.me  accept=application/json, text/plain, */*
    ${resp}=  POST ON SESSION  Insights   /api/v1/insights    headers=${headers4}   json=${json}
    Status Should Be  200  ${resp}
    log to console  ${resp}

#Assert valid Response Json
   log to console  ${resp.json}
   Status Should Be  200

#Validate total Sentence Count
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "sentenceCount":2523
    Status Should Be  200
    log to console  ${resp}

#Validate Correct topic 1 sentiment calculation
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "selectionFeedbackCount":1076
    Status Should Be  200
    log to console  ${resp}

#Validate sentence count
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "sentenceCount":2523
    Status Should Be  200
    log to console  ${resp}

#Validate sample ration
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "sampleRatio":1.0
    Status Should Be  200
    log to console  ${resp}


API GATEWAY LINEAR CARD ENDPOINT
    [Tags]      LINEAR
    create session  linear  https://stage-internal-api.lumoa.me  verify=true
    ${json}       Read JSON File        ${CURDIR}/Json_Files/linearfile.json
    ${body}      Read JSON File         ${CURDIR}/Json_Files/headerAPI.json
    ${accessToken}     GET ADMIN TOKEN
    ${headers4}=  create dictionary   Authorization=Bearer ${accesstoken}  authority=stage-api.lumoa.me  accept=application/json, text/plain, */*
    ${resp}=  POST ON SESSION  linear  /api/v1/linear   headers=${headers4}   json=${json}
    Status Should Be  200  ${resp}
    log to console  ${resp}

#Assert valid Response Json
   log to console  ${resp.json}
   Status Should Be  200

#Assert valid Response body
   ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "rollingAverage":0
    Status Should Be  200
    log to console  ${resp}

#Assert valid Response body
   ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  positiveFeedback":0
    Status Should Be  200
    log to console  ${resp}

#Assert valid Response body
   ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "scoreSum":0
    Status Should Be  200
    log to console  ${resp}

API GATEWAY LINEAR MAIN SCORE ENDPOINT
    [Tags]      LINEAR
    create session  linearMainScore  https://stage-internal-api.lumoa.me  verify=true
    ${json}       Read JSON File        ${CURDIR}/Json_Files/linearfile.json
    ${body}      Read JSON File         ${CURDIR}/Json_Files/headerAPI.json
    ${accessToken}     GET ADMIN TOKEN
    ${headers4}=  create dictionary   Authorization=Bearer ${accesstoken}  authority=stage-api.lumoa.me  accept=application/json, text/plain, */*
    ${resp}=  POST ON SESSION  linearMainScore  /api/v1/linearMainScore   headers=${headers4}   json=${json}
    Status Should Be  200  ${resp}
    #log to console  ${resp}

#Assert valid Response Json
   log to console  ${resp.json}
   Status Should Be  200


#Validate Number of totalfeedback
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "totalFeedback":111
    Status Should Be  200
    log to console  ${resp}

#Validate Number of total feedbacks with & without comment
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "totalFeedbackWithComment":59
    Status Should Be  200
    log to console  ${resp}

#Validate Response Content (Scoresum)
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "scoreSum":595
    Status Should Be  200
    log to console  ${resp}

#Validate Response Content (Detractors)
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "detractors":23
    Status Should Be  200
    log to console  ${resp}

#Validate Response Content (neutrals)
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "neutrals":5
    Status Should Be  200
    log to console  ${resp}

API GATEWAY LINEAR IMAPCT ENDPOINT
    [Tags]      LINEAR
    create session  linearImpacts  https://stage-internal-api.lumoa.me  verify=true
    ${json}       Read JSON File        ${CURDIR}/Json_Files/linearfile.json
    ${body}      Read JSON File         ${CURDIR}/Json_Files/headerAPI.json
    ${accessToken}     GET ADMIN TOKEN
    ${headers4}=  create dictionary   Authorization=Bearer ${accesstoken}  authority=stage-api.lumoa.me  accept=application/json, text/plain, */*
    ${resp}=  POST ON SESSION  linearImpacts  /api/v1/linearImpacts   headers=${headers4}   json=${json}
    Status Should Be  200  ${resp}
   # log to console  ${resp}

#Assert valid Response Json
   log to console  ${resp.json}
   Status Should Be  200

#Validate Number of average impacts
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "average":5.36
    Status Should Be  200
    log to console  ${resp}

#Assert 3 level topics and Impact calculation
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}   "#~#Trust","positiveCount":2,"positiveImpact":0.0985
    Status Should Be  200
    log to console  ${resp}

#Assert 3 level topics and Impact calculation
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  :"#~#General","positiveCount":13,"positiveImpact":1.72
    Status Should Be  200
    log to console  ${resp}

API GATEWAY LINEAR FEEDBACKCOUNT ENDPOINT
    [Tags]      LINEAR
    create session  feedbackCount  https://stage-internal-api.lumoa.me  verify=true
    ${json}       Read JSON File        ${CURDIR}/Json_Files/linearfile.json
    ${body}      Read JSON File         ${CURDIR}/Json_Files/headerAPI.json
    ${accessToken}     GET ADMIN TOKEN
    ${headers4}=  create dictionary   Authorization=Bearer ${accesstoken}  authority=stage-api.lumoa.me  accept=application/json, text/plain, */*
    ${resp}=  POST ON SESSION  feedbackCount  /api/v1/feedbackCount  headers=${headers4}   json=${json}
    Status Should Be  200  ${resp}
    #log to console  ${resp}

#Assert valid Response Json
   log to console  ${resp.json}
   Status Should Be  200

#Validate total feedback Count
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "totalFeedbacks":59
    Status Should Be  200
    log to console  ${resp}

#Validate single feedback Count 1
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "Alert","feedback":2
    Status Should Be  200
    log to console  ${resp}

#Validate single feedback Count 2
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "Kuda","feedback":16
    Status Should Be  200
    log to console  ${resp}

#Validate single feedback Count 2
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  :"Card","feedback":6
    Status Should Be  200
    log to console  ${resp}

API GATEWAY OPEN ENDED SENTIMENT COUNT CARD TEST
    [Tags]     OPEN_ENDED
    create session  sentimentCounts   https://stage-internal-api.lumoa.me  verify=true
    ${json}       Read JSON File        ${CURDIR}/Json_Files/openendedfile.json
    ${body}      Read JSON File         ${CURDIR}/Json_Files/headerAPI.json
    ${accessToken}     GET ADMIN TOKEN
    ${headers4}=  create dictionary   Authorization=Bearer ${accesstoken}  authority=stage-api.lumoa.me  accept=application/json, text/plain, */*
    ${resp}=  POST ON SESSION  sentimentCounts    /api/v1/sentimentCounts  headers=${headers4}   json=${json}
    Status Should Be  200  ${resp}
    #log to console  ${resp}

#Assert valid Response Json
   log to console  ${resp.json}
   Status Should Be  200

#Validate amount of feedback received in response body
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "amountOfFeedbacks":13764
    Status Should Be  200
    log to console  ${resp}

#Validate amount of statements in response body
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "amountOfStatements":14365
    Status Should Be  200
    log to console  ${resp}

#Validate amount of rolling positives in response body
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "rollingPositives":4990
    Status Should Be  200
    log to console  ${resp}

#Validate amount of rolling negatives in response body
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}   "rollingNegatives":8935
    Status Should Be  200
    log to console  ${resp}

#Validate amount of rolling neutals in response body
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}    "rollingNeutrals":9823
    Status Should Be  200
    log to console  ${resp}

API GATEWAY OPEN ENDED SENTIMENT SHARES CARD TEST
    [Tags]     OPEN_ENDED
    create session  sentimentShares   https://stage-internal-api.lumoa.me  verify=true
    ${json}       Read JSON File        ${CURDIR}/Json_Files/openendedfile.json
    ${body}      Read JSON File         ${CURDIR}/Json_Files/headerAPI.json
    ${accessToken}     GET ADMIN TOKEN
    ${headers4}=  create dictionary   Authorization=Bearer ${accesstoken}  authority=stage-api.lumoa.me  accept=application/json, text/plain, */*
    ${resp}=  POST ON SESSION  sentimentShares    /api/v1/sentimentShares  headers=${headers4}   json=${json}
    Status Should Be  200  ${resp}
    #log to console  ${resp}

#Assert valid Response Json
   log to console  ${resp.json}
   Status Should Be  200

#Validate Response Payload
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}   "totalImpact":44.833969037469146,"totalScore":35656
    Status Should Be  200
    log to console  ${resp}

#Validate Response Payload
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}   "#~#Brand#~#Brand","positiveCount":4,"positiveImpact":0.01121830827911151,"positiveScore":4
    Status Should Be  200
    log to console  ${resp}

#Validate Response Payload
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}   "#~#General#~#General","positiveCount":1245,"positiveImpact":3.4916984518734573,"positiveScore":1245,
    Status Should Be  200
    log to console  ${resp}

#Validate Response Payload Coversation Count
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}   "totalConversationCount":3134,"totalFeedbacks":25000,"totalFeedbacksWithComment":25000
    Status Should Be  200
    log to console  ${resp}

API GATEWAY OPEN ENDED getFEEDBACK TEST
    [Tags]     OPEN_ENDED
    create session  getFeedback  https://stage-internal-api.lumoa.me  verify=true
    ${json}       Read JSON File        ${CURDIR}/Json_Files/openendedfile.json
    ${body}       Read JSON File         ${CURDIR}/Json_Files/headerAPI.json
    ${accessToken}     GET ADMIN TOKEN
    ${headers4}=  create dictionary   Authorization=Bearer ${accesstoken}  authority=stage-api.lumoa.me  accept=application/json, text/plain, */*
    ${resp}=  POST ON SESSION  getFeedback    /api/v1/getFeedback  headers=${headers4}   json=${json}
    Status Should Be  200  ${resp}
    log to console  ${resp}


#Assert valid Response Json
   log to console  ${resp.json}
   Status Should Be  200

#Validate Feedback, Sentiment catergory and score
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}   "sentenceText":"We need some information before connecting you to a service advisor."
    Status Should Be  200
    log to console  ${resp}

#Assert valid feedBack ID
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}    "id":"22cf32b5-6e0b-4128-8e30-639a34a009ad"
    Status Should Be  200
    log to console  ${resp}

#Validate sentence text and sentiment score
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}   "Positive","sentimentScore":0.6879846453666687
    Status Should Be  200
    log to console  ${resp}

#Validate sentence text and Highlighter
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}   "sentenceText":"I want to exchange my email","isHighlight":true
    Status Should Be  200
    log to console  ${resp}

#Validate total feedback amount
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}   "amountOfFeedbacks":3134
    Status Should Be  200
    log to console  ${resp}


API GATEWAY OPEN ENDED FEEDBACK COUNT
    [Tags]     OPEN_ENDED
    create session  feedbackCount  https://stage-internal-api.lumoa.me  verify=true
    ${json}       Read JSON File        ${CURDIR}/Json_Files/openendedfile.json
    ${body}       Read JSON File         ${CURDIR}/Json_Files/headerAPI.json
    ${accessToken}     GET ADMIN TOKEN
    ${headers4}=  create dictionary   Authorization=Bearer ${accesstoken}  authority=stage-api.lumoa.me  accept=application/json, text/plain, */*
    ${resp}=  POST ON SESSION  feedbackCount    /api/v1/feedbackCount   headers=${headers4}   json=${json}
    Status Should Be  200  ${resp}
    log to console  ${resp}

#Assert valid Response Json
   log to console  ${resp.json}
   Status Should Be  200

#Validate Count per feedback Topic
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}   "Technical quality","feedback":1378
    Status Should Be  200
    log to console  ${resp}

#Validate Count per feedback Topic
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}  "Login","feedback":580
    Status Should Be  200
    log to console  ${resp}

#Validate Count per feedback Topic
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}   "Easiness","feedback":82
    Status Should Be  200
    log to console  ${resp}

#Validate total feedback amount
    ${body}=  Convert to String  ${resp.content}
    Should Contain  ${body}   :"Brand","feedback":9
    Status Should Be  200
    log to console  ${resp}