*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary
Library     OperatingSystem
Library     ListenerLibrary


*** Variables ***
${settings}                                 //*[@id="root"]/div/div/div[2]/div/div/div/div[3]/div[2]
${collections}                              //div[contains(text(),'COLLECTIONS')]
${Jobs_Page}                                //div[contains(text(),'JOBS')]
${new_job}                                  //*[@id="root"]/div/div/div[3]/div/div/div/div[2]/div[3]/div/button
${create_new_job}                           //*[@id='job-add-actions']/button
${Test_collection}                           //*[@id="menu-collection"]/div[3]/ul/li[3]
${Upload}                                   //input[@id='feedbackUpload']
${Excel_path}                               ${CURDIR}/DataFiles/Invalidexcel.xlsx
${ValidExcel_path}                          ${CURDIR}/DataFiles/ParcelLinear.xlsx
${Import}                                    //button[contains(text(),'Import')]
${Got_it}                                   //*[contains(text(),'Got it')]
${Close_Page}                                //*[contains(text(),'BACK')]

*** Keywords ***
Navigate to Settings Page
    mouse over                              ${settings}
    click element                           ${settings}
    set selenium implicit wait              3s
    page should contain                     User Management

Open Jobs page
    click element                          ${Jobs_Page}
    click button                           ${new_job}
    wait until element is visible          ${create_new_job}
    click button                           ${create_new_job}
    page should contain                    Import feedback
    press keys                             None     TAB+TAB
    press keys                             None     ENTER
    click element                          ${Test_collection}

Import Valid Excel Feedback

    set selenium implicit wait             20
    choose file                       ${Upload}      ${ValidExcel_path}


Assert Succesful Upload
    wait until page contains                 xlsx    60s
     page should contain                    xlsx

Import Excel Data
    #set selenium implicit wait           5s
    set focus to element                 ${Import}
    click button                         ${Import}
    page should contain                  Got it



