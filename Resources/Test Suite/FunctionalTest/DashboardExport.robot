*** Settings ***
Documentation    Test to verify cards in Lumoa dashboards open correctly and
...              all pages in the module works
...              https://stage.lumoa.me/executive
Resource        ../../SurveyPage_Test/Resources/DashboardExport.resource
Resource         ../../SurveyPage_Test/Resources/CommonFiles.resource
Resource          ../../Resources/DashboardExport.resource
Suite Setup         set log level  DEBUG
#Test Setup          set selenium speed   1
Suite Teardown      Close all Browsers

*** Test Cases ***
Lumoa Login
    [Tags]      Valid Login
    Set up Lumoa Environment
    Valid login
    Assert Valid login

Open Test Card
    [Tags]    Dashboard
    Inspect Card in Dashboard

Export Trends
    Export Card Trends
    Validate trends download email link

Export Impacts
    Set up Lumoa Environment
    Valid login
    Assert Valid login
    Inspect Card in Dashboard
    Export card impacts
    Validate impacts email link

Export Responses
    Set up Lumoa Environment
    Valid login
    Assert Valid login
    Inspect Card in Dashboard
    Export card responses
    Validate responses email link

Export All feedback
    Set up Lumoa Environment
    Valid login
    Assert Valid login
    Inspect Card in Dashboard
    Export All feedback
    Validate all feedback email link

Export Detailed feedback
    Set up Lumoa Environment
    Valid login
    Assert Valid login
    Inspect Card in Dashboard
    Export card detailed feedback
    Validate detailed feedback link

Export Contact Request
    Set up Lumoa Environment
    Valid login
    Assert Valid login
    Inspect Card in Dashboard
    Export card contact requests
    Validate card contact request feedback email link