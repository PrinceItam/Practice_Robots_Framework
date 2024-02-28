*** Settings ***
Documentation       Tests to verify that Lumoa Survey page runs correctly and
...                 validate survey type creation and
...                 tests critical steps
...                 See https://lumoa.me/solutions/survey-analytics
Resource            ../../SurveyPage_Test/Resources/Surveypage.resource
Resource            ../../SurveyPage_Test/Resources/CommonFiles.resource
Suite Setup         set log level  DEBUG
Test Setup          set selenium speed   0.01
Suite Teardown      Close all browsers


*** Test cases ***
Lumoa Login
        [Tags]      Valid Login
        Set up Lumoa Environment
        Valid login
        Assert Valid login

Run Tests on Campaign Page
       [Tags]      Survey
       Navigate to Survey page
       Inspect Author's Field
       Inspect Survey Type Field
       Inspect Status Field

Open Create Survey Campaign Frame
        [Tags]      Survey
        Create Survey Campaign Page
        Email Survey
        Create Survey Campaign Page
        Link Survey
        Create Survey Campaign Page
        Web Popup Survey

View Reports
       [Tags]      Survey
      Report Viewer

Create new Survey
       [Tags]      Survey
       Navigate to Surveys Module
       Open Setup menu and fill parameters
       Open questions menu and fill parameter
       Open settings menu and fill parameter
       Open thank you menu and fill parameter
       Select template style
       Inspect audience page

