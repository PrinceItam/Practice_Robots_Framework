*** Settings ***
Documentation  There is a need to trigger single import pipeline via survey to test sentiments
Resource            ../../SurveyPage_Test/Resources/Survey2test.resource
Suite Setup         set log level  DEBUG
Test Setup          set selenium speed  0.01
Suite Teardown      Close all browsers


*** Test Cases ***
Open Survey Link Campaign
  # FOR  ${index}    IN RANGE  1

    #[Tags]    Surveys
    open link Campaign
    select a rating score
    add feedback comment
    user clicks on send button
    survey should be sent sucessfully
   # END



