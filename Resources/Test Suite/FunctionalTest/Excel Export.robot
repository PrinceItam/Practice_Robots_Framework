*** Settings ***
Documentation    Automation workflow on excel import funtionality in Lumoa UI
Resource         ../../SurveyPage_Test/Resources/CommonFiles.resource
Resource         ../../SurveyPage_Test/Resources/Excelimport.resource
Suite Setup     set log level  DEBUG
#Test Setup      set selenium speed   0.1
#Suite Teardown  Close all browsers

*** Test Cases ***
Lumoa Login
        [Tags]      Valid Login
        Set up Lumoa Environment
        Valid login
        Assert Valid login

Import Excel Data
        [Tags]      Excel Upload
        Navigate to Settings Page
        Open Jobs page
        Import Valid Excel Feedback
        Assert Succesful Upload
        Import Excel Data

