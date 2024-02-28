*** Settings ***
Library     Selenium2Library
Library     FakerLibrary
Library     OperatingSystem
Library     ListenerLibrary
Library     ImapLibrary


*** Variables ***
${Survey_landing_page}      //*[@id='root']/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[3]/div[1]/*[1]
${Author_searchbox}         //*[contains(text(),'Author')]
${Qa_user}                  //*[contains(text(),'newuseremailtest')]
${Type}                     //*[contains(text(),'Type')]
${Link}                     //span[contains(text(),'Link')]
${Status}                   //*[contains(text(),'Status')]
${Active}                  //*[contains(text(),'Active')]
${Add_link}                 //*[@id='root']/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]/div[2]/div[1]/div[4]/div[1]/button[1]
${create_link}              //*[@id="campaign-add-actions"]/button
${Assert}                   //body/div[4]/div[3]/div[1]/h2[1]/div[1]
${Select_email_survey}      name:EMAIL
${ES_name}                  css:#campaign-name
${ES_Template}              //body/div[7]/div[3]/div[1]/div[2]/div[2]/div[1]/form[1]/div[2]/div[1]/div[1]/div[1]
${ES_Survey_Type}           id:mui-48
${ES_Tags}                  //*[@id="email-campaign-form"]/div[3]/div/div/div
${ES_App}                   //*[contains(text(),'App')]
${Email_Subject}            //input[@id='campaign-subject']
${Email_Input}              //*[@id="email-campaign-form"]/div[5]
${ES_Next}                  //*[contains(text(),'NEXT')]
${Review}                   //*[contains(text(),'survey@lumoa.me')]
${Send_Now}                 //*[contains(text(),'Send')]
${Link_Survey}             name:LINK
${LS_Name}                  css:#campaign-name
${Link_Surveytemplate}      //*[@id="email-campaign-form"]/div[2]/div/div/div
${Link_Copy}                //*[contains(text(),'Copy')]
${Link_Save}                //*[contains(text(),'SAVE')]
${Web_Survey}               name:POPUP
${Webpop_Name}              css:#campaign-name
${Webpop_Surveytemplate}    //*[@id="email-campaign-form"]/div[2]/div/div/div/input
${%users_view}              //*[@id="email-campaign-form"]/div[4]/div/input
${Popup_display}            id:lumoa-survey-main-title
${Popup_delay}              //*[@id="email-campaign-form"]/div[3]
${Popup_Delayform}          //*[@id="email-campaign-form"]/div[3]/div/input
${Popup_Save}               //*[contains(text(),'SAVE')]
${Popup_APIkey}             id:popup-sync
${Close_popwindow}          //*[contains(text(),'CLOSE')]
${View_Report}              //*[contains(text(),'View report')]
${Close_report}             //*[@id="mui-65"]/div/button
${New_surveyPage}           //*[contains(text(),'SURVEYS')]
${Add_survey}               //*[@id="root"]/div/div/div[3]/div/div/div/div[2]/div[4]/div/button
${Create_newSurvey}         //*[@id="survey-add-actions"]/button
${Input_Lang}              //*[@id="languages-select"]/div[1]/div[1]
${Input_English}           //*[contains(text(),'en')]
${Survey_next}             //*[contains(text(),'NEXT')]
${Survey_back}              //*[contains(text(),'BACK')]
${select collection}         //div[@id='collection-select']
${collection_id}          //*[@id="menu-feedbackCollectionId"]/div[3]/ul/li[10]
${Survey_name}              id=survey-name
${Language_select}          //*[@id="lumoaSurveyWrapper"]/div[1]/form
${English}                  //*[contains(text(),'English')]
${Questions_tab}            //*[@id="Question"]/div/div[1]/div/div/div
${Privacy_Policy}           //*[@id="Settings"]/div[1]/div/span/input
${Socialmedia}              //*[@id="Settings"]/div[3]/div/span/input
${User_contacts}            //*[@id="contact-request"]
${Confirmation}             //*[@id="Thank you"]/div/div[1]/div/div[1]/div/div
${Browse_Image}             css:#file_browse_button
${Image}                    //*[@id="file_browse_button"]/input
${Image_path}               ${CURDIR}/DataFiles/Lumoa-icon.jpg
${Lumoa_Icon}               //*[@id="file_upload_root"]/div[2]/div
${delete survey_kebab}            //tbody/tr[1]/td[7]/*[1]
${delete_survey}            //*[contains(text(),'Delete')]
${yes}                      //*[contains(text(),'Yes')]
${Audience_Page}             //div[contains(text(),'AUDIENCE')]
${Add_New_Audience}         //*[@id="root"]/div/div/div[3]/div/div/div/div[2]/div/div[4]/div/button
${create_Audience}          //*[@id="audience-import-actions"]/button
${Assert_Audience_Page}     //*[contains(text(),'Import audience')]
${Audience_upload}          id:audienceImport
${Audience_upload_Path}     ${CURDIR}/DataFiles/audience.xlsx
${Import}                   //button[contains(text(),'import')]
${Got_It}                   //*[contains(text(),'Got it')]
${Surveys_next}             //body/div[4]/div[3]/div/div[3]/div[2]/button[2]/span
${Survey_create}            /html/body/div[6]/div[3]/div/div[3]/div[2]/button[2]


*** Keywords ***
from __future__ import print_function
class my_listener():
    ROBOT_LISTENER_API_VERSION = 2
    def __init__(self):
        self.ROBOT_LIBRARY_LISTENER = self
        self.last_log = None

    def _log_message(self, message):
        self.last_log = message

    def _end_keyword(self, name, attrs):
        if attrs['status'] == 'FAIL':
            print("\n******\n", self.last_log['message'])


*** Keywords ***
Navigate to Survey page
    Click Element                       ${Survey_landing_page}
    Page Should Contain                 Campaign

Inspect Author's Field
    Set selenium implicit wait         5s
    wait until element is enabled      ${Author_searchbox}
    mouse down                         ${Author_searchbox}
    set selenium implicit wait         5s
    press keys                         none    usergroupfinland
    page should contain                usergroupfinland@mailinator.com

Inspect Survey Type Field
    Mouse down                          ${Type}
    press keys                          None     ARROW_DOWN+ARROW_DOWN
    press keys                          None     ENTER
    Page Should Contain                 Link

Inspect Status Field
    Mouse down                           ${Status}
    Click Element                        ${Active}
    Page Should Contain                   Active

Create Survey Campaign Page
    Mouse down                          ${Add_link}
    set selenium implicit wait          2s
    click button                        ${create_link}
    page should contain                 Create survey campaign

Email Survey
    click element                    ${Select_email_survey}
    ${Surveyfilename}                FakerLibrary.Name
    log                              ${Surveyfilename}
    Set Test Variable                ${Surveyfilename}
    Input Text                       ${ES_name}   ${Surveyfilename}
    press keys                          None         TAB
    set selenium speed                  1
    press keys                          None      Testing
    press keys                         None     ARROW_DOWN
    press keys                          None          ENTER
    press keys                          None         TAB
    press keys                          None           App
    press keys                          None          ENTER
    press keys                          None         TAB
    Mouse down                      ${Email_Subject}
    click element                   ${Email_Input}
    ${EmailSub}                      FakerLibrary.Domain Name
    log                              ${EmailSub}
    Set Test Variable                ${EmailSub}
    Input Text                       ${Email_Subject}   ${EmailSub}
    Click button                     ${ES_Next}
    Page should contain Element      ${Review}
    Click Element                    ${Send_Now}

Link Survey
    click element                     ${Link_Survey}
    ${Linkfilename}                   FakerLibrary.Name
    log                               ${Linkfilename}
    Set Test Variable                 ${Linkfilename}
    Input Text                        ${LS_Name}   ${Linkfilename}
    press keys                          None         TAB
    set selenium speed                  1
     input text                         ${Webpop_Surveytemplate}  Testing
    press keys                         None     ARROW_DOWN
    press keys                         None     ARROW_DOWN
    press keys                          None          ENTER
    press keys                          None         TAB
    set selenium speed                  0.1
    click button                       ${Link_Copy}
    click element                     ${Link_Save}

Web Popup Survey
    click element                       ${Web_Survey}
    ${Webpopfilename}                   FakerLibrary.Name
    log                                 ${Webpopfilename}
    Set Test Variable                   ${Webpopfilename}
    Input Text                          ${Webpop_Name}    ${Webpopfilename}
    press keys                          None         TAB
    input text                          ${Webpop_Surveytemplate}  Testing
    set selenium speed                  1
    press keys                          None     ARROW_DOWN
    press keys                          None     ARROW_DOWN
    press keys                          None          ENTER
    press keys                          None         TAB
    input text                          ${Popup_Delayform}     4
    press keys                          None         TAB
    input text                          ${%users_view}       100
    press keys                          None         TAB
    click element                       ${Popup_Save}
    set selenium implicit wait          5s
    page should contain element         ${Popup_APIkey}

Report Viewer
    set selenium implicit wait          2s
    reload page
    click element                       ${View_Report}
    press keys                          None   ESC

Navigate to Surveys Module
    click element                    ${New_surveyPage}
    Mouse down                       ${Add_survey}
    set selenium implicit wait       2s
    click button                     ${Create_newSurvey}
    page should contain              Create survey

Open Setup menu and fill parameters
    set selenium speed                  1
    click element                       ${select collection}
    click element                      ${collection_id}
    mouse down                          ${Survey_name}
    ${Surveyfilename}                   FakerLibrary.Name
    log                                 ${Surveyfilename}
    Set Test Variable                   ${Surveyfilename}
    Input Text                          ${Survey_name}      ${Surveyfilename}
    set selenium speed                   0.3
    press keys                          None         TAB
    press keys                         None      Fin
    press keys                         None      ARROW_DOWN+ENTER
    press keys                         None       TAB
    click element                       ${Survey_next}

Open questions menu and fill parameter
    set selenium speed                    0.01
    mouse down                          ${Questions_tab}
    press keys                         None  CTRL+a
    press keys                          None   DELETE
    wait until element is visible        ${Questions_tab}
    ${Surveyquestion}                   FakerLibrary.Paragraph
    log                                 ${Surveyquestion}
    Set Test Variable                   ${Surveyquestion}
    press keys                          ${Questions_tab}    ${Surveyquestion}
    press keys                          None         TAB
    press keys                          None        Low
    press keys                          None         TAB
    press keys                          None         High
    press keys                          None         TAB
    press keys                          None         Please Select Score
    press keys                          None         TAB
    press keys                          None         Provide Answer Reason
    press keys                          None         TAB
    press keys                          None         Send
    press keys                          None         TAB
    press keys                          None         Must Rate Survey
    press keys                          None         TAB
    click element                       ${Survey_next}

Open settings menu and fill parameter
    click button                    ${Privacy_Policy}
    press keys                          None         TAB
    press keys                          None         Privacy Policy
    press keys                          None         TAB
    press keys                          None         https://act.lumoa.me
    click button                        ${Socialmedia}
    press keys                          None         TAB
    press keys                          None         https://business.facebook.com/lumoacompany/
    press keys                          None         TAB
    press keys                          None         https://instagram.com/lumoa.me/?hl=en
    press keys                          None         TAB
    press keys                          None         https://linkedin.com/company/lumoa
    press keys                          None         TAB
    press keys                          None         https://twitter.com/lumoa
    click button                        ${User_contacts}
    press keys                          None         TAB
    press keys                          None         https://lumoaQA022@mailinator.com
    press keys                          None         ENTER

Open thank you menu and fill parameter
    click element                       ${Confirmation}
    press keys                          None        Confirmation Tile (Detractor)
    press keys                          None         TAB
    press keys                          None         Confirmation Text (Detractor)
    press keys                          None         TAB
    press keys                          None         Button Text (Detractor)
    press keys                          None         TAB
    press keys                          None         https://stage.lumoa.me
    press keys                          None         TAB
    press keys                          None       Confirmation Tile (Passive)
    press keys                          None         TAB
    press keys                          None         Confirmation Text (Passive)
    press keys                          None         TAB
    press keys                          None         Button Text (Passive)
    press keys                          None         TAB
    press keys                          None         https://stage.lumoa.me
    press keys                          None         TAB
    press keys                          None        Confirmation Tile (Promoter)
    press keys                          None         TAB
    press keys                          None         Confirmation Text (Promoter)
    press keys                          None         TAB
    press keys                          None         Button Text (Promoter)
    press keys                          None         TAB
    press keys                          None         https://stage.lumoa.me
    wait until element is enabled        ${Survey_next}
    click element                       ${Survey_next}

Select template style
    wait until page contains element      ${Image}
    choose file                           ${Image}        ${Image_path}
    wait until element is visible         ${Lumoa_Icon}
    mouse down                            ${Lumoa_Icon}
    page should contain                   Lumoa-icon.jpg
    set selenium speed                     1
    click element                         ${Popup_Save}
    set selenium implicit wait            3s
    Page should contain                   Title
    reload page
    click element                       ${delete survey_kebab}
    click element                       ${delete_survey}
    click element                       ${yes}

Inspect audience page
    set selenium implicit wait          3s
    click element                       ${Audience_Page}
    Mouse down                          ${Add_New_Audience}
    wait until element is visible       ${create_Audience}
    click element                        ${create_Audience}
    Page Should Contain Element         ${Assert_Audience_Page}
    choose file                         ${Audience_upload}    ${Audience_upload_Path}
    page should contain                 audience.xlsx
    click button                        ${Import}
   # press keys                          None   TAB+TAB+ENTER
    page should contain                 Success!
    press keys                          None  ESC
    reload page


