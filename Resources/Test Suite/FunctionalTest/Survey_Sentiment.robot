*** Settings ***
Documentation  There is a need to trigger single import pipeline via survey to test sentiments
Resource            ../../SurveyPage_Test/Resources/Surveysentiment.resource
Suite Setup         set log level  DEBUG
Suite Teardown      Close all browsers


*** Test Cases ***
Open Survey Link Campaign
    FOR  ${index}    IN RANGE  1
    open link Campaign
    select a rating score
    add feedback comment
    user clicks on send button
    survey should be sent sucessfully
    test survey without comment
    survey should be sent sucessfully
    END





