*** Settings ***
Library   SeleniumLibrary
Library    FakerLibrary


*** Variables ***
${Q&A}                       //div[contains(text(),'Q&A')]
${Automation_scripts}       //*[@id="root"]/div/div/div[3]/div/div/div[1]/div[2]/div[1]/div/div[2]/div[1]/div
${Response_amt}              //div[contains(text(),'61208 responses')]
${Parcel_ID}                 xpath://*[@id="root"]/div/div/div[3]/div/div/div[1]/div[2]/div[35]/div/div[1]/div[1]
${Parcel_ID_Title}           xpath://*[@class='title']
${Impactkebab_menu}          xpath://*[@id="root"]/div/div/div[3]/div/div[2]/div/div[2]/div/div[1]/div/div[2]/div[2]/div/div/div/div/div[1]/div[2]/button
${Graph_type}                xpath://p[contains(text(),'Graph type')]
${Custom_graph}             xpath://p[contains(text(),'Custom')]
${Simple_graph}             xpath://p[contains(text(),'Simple graph')]
${Default_graph}            //p[contains(text(),'Default chart')]
${Simplegraph_score}        xpath://*[contains(text(),'Score')]
${Date_range}               //div[contains(text(),'01.01.18')]
${Change_Month}             //div[contains(text(),'January')]
${New_Month}                //button[contains(text(),'Oct')]
${New_Year}                 //button[contains(text(),'2018')]
${New_Date}                 //button[contains(text(),'6')]
${End_Date}                  //button[contains(text(),'11')]
${topic_impacts}            //*[contains(text(),'Topic impacts')]
${topic_response}           //*[contains(text(),'Topic responses')]
${Great_topic}               //*[contains(text(),'App')]
${Bankingapp_topic}          //body/div[@id='root']/div[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]
${Feedback}                   //h6[contains(text(),'1138 comments')]
${Insights_Volume}           //*[contains(text(),'Insights by volume')]
${Trending:insights}          //*[contains(text(),'Trending insights')]
${Card_responses}           //div[contains(text(),'61199 comments')]
${Feedback_comments}        //div[contains(text(),'61199 comments')]
${Visibility_Icon}          //div[@id='root']/div[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[2]/div[1]/div[2]/div[3]/div[1]/div[1]/div[4]/button[1]/div[1]/*[1]
${Empty_comments}           //div[contains(text(),'Empty comments')]
${Empty_comments_number}       //*[contains(text(),'61208 comments')]
${compare_page}                 //*[contains(text(),'COMPARE')]
${Topic_Impacts}              //*[contains(text(),'Topic impacts')]
${filters_list}             //*[@id="root"]/div/div/div[3]/div/div[2]/div/div/div[3]/div[1]/div[1]/div/div/div/div[2]/div
${Top_menu}                 //*[contains(text(),'Automation Scripts')]
${Topic_comments}           //*[contains(text(),'comments')]
${fruits}                   //*[@id='menu-']/div[3]/ul[1]/div[2]/div[2]/div[1]/span[1]/input[1]
${Apply}                    //*[contains(text(),'Apply')]
${filters_list2}             //*[@id="root"]/div/div/div[3]/div/div[2]/div/div/div[3]/div[2]/div[1]/div/div/div/div[2]/div/div
${Country}                  //*[@id="menu-"]/div[3]/ul/div[2]/div[6]/div[1]/span/input
${Trends}                    //*[contains(text(),'TRENDS')]
${Show_topics}              //*[contains(text(),'Show top level topics')]
${Test_topic}               //body/div[@id='menu-selectCategory']/div[3]/ul[1]/li[4]
${Time_frame}               id:mui-component-select-group
${Week}                     //*[contains(text(),'Week')]
${Insights}                 //*[contains(text(),'INSIGHTS')]
${Insights_list}            //*[contains(text(),'Automation Scripts')]
${Amount of feeback}        //*[contains(text(),'Amount of feedback')]
${Long_Tag}                 //*[contains(text(),'LongTag')]
${Message_Icon}             //*[@id="root"]/div/div/div[3]/div/div[2]/div/div/div/div[3]/div[1]/div[3]/div[1]/div[2]/div/div/div[1]/div/div[2]/button
${Select_Assignee}          //*[contains(text(),'Select assignee')]
${Assignee_ID}              //*[contains(text(),'Developer2 Stage')]
${Title}                    id:title-full-width
${Value}                    id:value-full-width
${Note}                     id:outlined-full-width
${Image}                    id:file_browse_button
${Image_Path}               ${CURDIR}/DataFiles/Test_image.jpg
${Save}                     //*[contains(text(),'SAVE')]
${Events_page}              //*[contains(text(),'EVENTS')]
${Date_range2}              //body/div[@id='root']/div[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[2]/div[2]/div[4]
${settings_icon}            //*[@id="root"]/div/div/div[3]/div/div[2]/div/div/div/div[1]/div[2]/div[1]
${insights_country}         //*[contains(text(),'country')]
${This_Year}                //*[contains(text(),'This week')]
${This_Week}                //*[contains(text(),'This year')]
${Event_Note}               //div[contains(text(),'Mozilla/5.0')]
${Show_all_events}          //*[@id="root"]/div/div/div[3]/div/div[2]/div/div[3]/div[2]/span
${Add_New_Event}            //*[@id="root"]/div/div/div[3]/div/div[2]/div/div[5]/div/button
${Create_event}             //*[@id="events_create-actions"]/button
${Assignee}                 //div[contains(text(),'test Obla')]
${Assignee_IMAP}            //div[contains(text(),'Automation Code')]
${events_text}              //div[contains(text(),'Lumoa King Of CX?')]
${kebab_menu}               //*[@id="root"]/div/div/div[3]/div/div[2]/div/div[4]/div/div/div[1]/div[3]/div[1]/button
${Delete}                   //*[contains(text(),'Delete')]
${Close}                    //*[contains(text(),'CLOSE')]
${mailurl}                  https://www.mailinator.com/v4/public/inboxes.jsp?msgid=princeqatest-1638228368-740936&to=newuseremailtest#
${mailbrowser}              chrome
${email_subject}            //td[contains(text(),'New Note Assignment')]
${mail_frame}               //iframe[@id='html_msg_body']
${CustomGraph_Chart}        xpath://*[contains(text(),'Preview')]
${CustomGraph_Type}         //body/div[10]/div[3]/div/div[1]/div/div[1]/div/div[1]/div/input
${CustomGraph_Filter}       xpath://*[contains(text(),'All')]
${CustomGraph_GraphType}    xpath://html/body/div[9]/div[3]/div/div[1]/div/div[1]/div/div[2]/div/div  #//div[contains(@class, 'MuiFormControl-root css-13sljp9') and not(contains(@text(), 'Type'))]
${zResponse_amt}             //Li [contains(text(),'Response amount')]
${zImpact}                   //*[@id="menu-"]/div[3]/ul/li[2]
${zfilterscore}              //Li [contains(text(),'Filter Score')]
${GraphType_Bar}            //body/div[@id='menu-']/div[3]/ul[1]/li[1]
${GraphType_WaterFall}      //body/div[@id='menu-']/div[3]/ul[1]/li[2]
${GraphType_Line}           //body/div[@id='menu-']/div[3]/ul[1]/li[3]
${GraphFilter_Country}      //*[@id="menu-"]/div[3]/ul/li[2]
${Country_Global}           //span[contains(text(),'Global')]
${Country_Finland}          //*[contains(text(),'Finland')]
${Country_Usa}              //*[contains(text(),'Usa')]
${Country_Uk}               //*[contains(text(),'Uk')]
${zfilter_options}           id:filter-options
${CustomGraph_Cancel}       xpath://*[contains(text(),'Cancel')]
${CustomGraph_Save}         xpath://button[@data-testid='save-button']
${CustomGraph_Response}     //div[contains(text(),'Response amount')]
${Device}                   //body/div[@id='menu-']/div[3]/ul[1]/li[7]
${Impact_chart}             //body/div[@id='menu-']/div[3]/ul[1]/li[2]


*** Keywords ***
Inspect Card in Dashboard
     click element                         ${Q&A}
     set selenium implicit wait            10
     page should contain element           ${Response_amt}
     click element                         ${Automation_scripts}
     set selenium implicit wait            3s
     page should contain                   Automation Scripts

Change default graph type
    click button                          ${Impactkebab_menu}
    click element                            ${Graph_type}
    click element                            ${Simple_graph}
    page should contain element             ${Simplegraph_score}

Change date range
    click element                             ${Date_range}
    click element                             ${Change_Month}
    click element                             ${New_Month}
    click element                             ${New_Year}
    click element                             ${New_Date}
    click element                             ${End_Date}

Change Custom Graph type
    click button                        ${Impactkebab_menu}
    click element                        ${Graph_type}
    click element                        ${Custom_graph}
    page should contain element          ${CustomGraph_Chart}

Inspect Custom Response Type Graph
    press keys                          None    TAB+TAB
    press keys                          None     ENTER
    click element                       ${zResponse_amt}
    press keys                          None    TAB+ENTER
    click element                       ${GraphType_Bar}
    click button                        ${CustomGraph_Save}
    set selenium implicit wait          10s
    page should contain                 Response amount
    reload page

Inspect Respose Type Graph with Filter
    click button                         ${Impactkebab_menu}
    click element                        ${Graph_type}
    click element                        ${Custom_graph}
    page should contain element          ${CustomGraph_Chart}
    press keys                          None    TAB+TAB
    press keys                          None     ENTER
    click element                       ${zResponse_amt}
    press keys                          None    TAB+ENTER
    click element                       ${GraphType_WaterFall}
    press keys                          None    TAB+ENTER
    click element                       ${Device}
    click button                        ${CustomGraph_Save}
    set selenium implicit wait          10s
    page should contain             Total
    reload page

Inspect Custom Graph with Impact Waterfall Graph
    click button                         ${Impactkebab_menu}
    click element                        ${Graph_type}
    click element                        ${Custom_graph}
    page should contain element          ${CustomGraph_Chart}
    press keys                          None    TAB+TAB
    press keys                          None     ENTER
    click element                       ${zImpact}
    press keys                          None    TAB+ENTER
    click element                       ${GraphType_WaterFall}
    click button                        ${CustomGraph_Save}
    set selenium implicit wait          5s
    page should contain                 Testing
    reload page

Inspect Filter Score graph with filters options
    click button                        ${Impactkebab_menu}
    click element                        ${Graph_type}
    click element                        ${Custom_graph}
    page should contain element          ${CustomGraph_Chart}
    press keys                          None    TAB+TAB
    press keys                          None     ENTER
    click element                       ${zfilterscore}
    press keys                          None    TAB+ENTER
    click element                       ${GraphType_Line}
    click element                       ${zfilter_options}
    press keys                          None     ARROW_DOWN+ENTER
    press keys                          None     ARROW_DOWN+ENTER
    press keys                          None     ARROW_DOWN+ENTER
    press keys                          None     ARROW_DOWN+ENTER
    press keys                          None     ARROW_DOWN+ENTER
    wait until page contains            Jan '21
    click element                       ${CustomGraph_Save}
    set selenium speed                  0.1
    page should contain                Global
    reload page
    click button                        ${Impactkebab_menu}
    click element                       ${Graph_type}
    click element                       ${Custom_graph}
    press keys                          None    TAB+TAB
    press keys                          None    TAB+ENTER
    click element                       //body/div[@id='menu-']/div[3]/ul[1]/li[5]
    click element                       ${CustomGraph_Save}

View topic response
    set selenium speed                          1
    set selenium implicit wait                  10s
    click element                               ${topic_impacts}
    click element                               ${topic_response}
    page should contain                         Topic responses
    set selenium implicit wait                  5
    mouse over                                  ${Great_topic}
    click element                               ${Great_topic}
    wait until element is visible                ${Bankingapp_topic}
    mouse over                                  ${Bankingapp_topic}
    click element                               ${Bankingapp_topic}
    Execute javascript    window.scrollTo(0,document.body.scrollHeight)
    page should contain                         1056 comments
    reload page

View Insights
    wait until element is visible               ${Insights_Volume}
    click element                               ${Insights_Volume}
    click element                               ${Trending:insights}
    reload page

Card Response Check
    set selenium implicit wait                  15s
    click element                               ${Card_responses}
    page should contain                         61199 comments
    scroll element into view                    ${Feedback_comments}
    click element                               ${Feedback_comments}
    wait until page contains                    61199 comments
    page should contain                         61199 comments
    Execute JavaScript                          window.scrollTo(0, 10000)
    click element                               ${Visibility_Icon}
    wait until element is visible               ${Empty_comments}
    click element                               ${Empty_comments}
    page should contain element                 ${Empty_comments_number}

Open Compare Page
    click element                                ${compare_page}
    set selenium implicit wait                   5
    page should contain                          COMPARE

Filters lists left
    set selenium speed                           1s
    Execute JavaScript                          window.scrollTo(0, 10000)
    page should contain                         61208 comments
   # scroll element into view                    ${Top_menu}
    set selenium speed                          0.01
    click element                               ${filters_list}
    select checkbox                             ${fruits}
    click element                               ${Apply}
    page should contain                         banana

Filters lists right
    click element                               ${filters_list2}
    select checkbox                             ${Country}
    click element                               ${Apply}
    page should contain                         pear

Test Trends Page
    click element                               ${Trends}
    set selenium implicit wait                  4s
    page should contain                         Positive Impact per Month
    wait until element is visible                ${Show_topics}

Test topic trends
    mouse down                                  ${Show_topics}
    click element                               ${Test_topic}
    click element                               ${Time_frame}
    click element                               ${Week}
    Execute javascript    window.scrollTo(0,document.body.scrollHeight)

Test Insights Page
    click element                               ${Insights}
    set selenium implicit wait                  10s
    page should contain                         Automation Scripts
    click element                               ${settings_icon}
    page should contain                         Insight Settings
    click button                                ${insights_country}
    click button                                 2
    click element                               ${Save}
    set selenium implicit wait                  15s
    page should contain element                 ${Amount of feeback}

View all events
    click element                              ${Events_page}
    page should contain                        To Do
    click element                              ${Date_range2}
    click element                              ${This_Year}
    click element                              ${Show_all_events}

Create test event
   set selenium implicit wait                  5s
    click button                              ${Add_New_Event}
    click button                             ${Create_event}
    page should contain                        Notes
    click element                              ${Select_Assignee}
    scroll element into view                   ${Assignee_IMAP}
    click element                              ${Assignee_IMAP}
    click element                              ${Title}
    input text                                 ${Title}  Lumoa King Of CX?
    click element                              ${Note}
    ${Event_Note}                              FakerLibrary.Paragraph
    log                                        ${Event_Note}
    Set Test Variable                          ${Event_Note}
    press keys                                 ${Note}  ${Event_Note}
    choose file                                ${Image}  ${Image_Path}
    click element                              ${Save}
    set selenium implicit wait                 5s
    page should contain                        Event created
    reload page

Assert Test Event Created
     click element                              ${Date_range2}
     click element                              ${This_Week}
     wait until page contains                   Lumoa King Of CX?   5s
     page should contain                        Lumoa King Of CX?

Delete Event Note
     mouse over                                 ${events_text}
     wait until element is visible              ${kebab_menu}
     mouse down                                 ${kebab_menu}
     click element                              ${kebab_menu}
     click element                              ${Delete}
     page should not contain                    Version
     close browser

#Email Verification
    #Open Mailbox    host=imap4.hotmail.com    user=Lumoautomation@hotmail.com  password=Lumoa-2016
    #${LATEST} =   wait for email  sender=help@lumoa.me   timeout=300
    #${HTML} =    Open Link From Email    ${LATEST}
    #Should Contain    ${HTML}    New Note Assignment
    #Close Mailbox

Email Verification
    open browser                         ${mailurl}         ${mailbrowser}
    maximize browser window
    click element                        ${email_subject}
    page should contain                  Lumoa King Of CX?
    select frame                         ${mail_frame}
    click element                        tag:a
    Switch Window                        locator=NEW
    page should contain                  Lumoa