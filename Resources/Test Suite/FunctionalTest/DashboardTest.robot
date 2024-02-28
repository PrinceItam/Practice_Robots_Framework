*** Settings ***
Documentation    Test to verify cards in Lumoa dashboards open correctly and
...              all pages in the module works
...              https://stage.lumoa.me/executive
Resource        ../../SurveyPage_Test/Resources/Alldashboard.resource
Resource         ../../SurveyPage_Test/Resources/CommonFiles.resource
Resource     ../../Resources/Alldashboard.resource
Suite Setup         set log level  DEBUG
Test Setup          Close all Browers
Test Setup          ...set selenium speed   0.5
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

Inspect Graphs
    [Tags]    Selfcare
    Change default graph type
    Change date range

Inspect Custom Graphs
    [Tags]    Custom Graph
    Change Custom Graph type
    Inspect Custom Response Type Graph
    Inspect Respose Type Graph with Filter
    Inspect Custom Graph with Impact Waterfall Graph
    Inspect Filter Score graph with filters options

Inspect Topics Menu
    [Tags]    Data analysis
    View topic response
    View Insights
    Card Response Check

View Compare Page
    [Tags]    Data analysis
    Open Compare Page
    Filters lists left
    Filters lists right

Trends Page
    [Tags]    Data analysis
    Test Trends Page
    Test topic trends

Insights Page
    [Tags]    Data analysis
    Test Insights Page

Events Page
    [Tags]    Events
    View all events
    Create test event
    Assert Test Event Created
    Delete Event Note
    Email Verification

