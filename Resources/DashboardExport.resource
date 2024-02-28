*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem



*** Variables ***
${Q&A}                       //div[contains(text(),'Q&A')]
${Automation_scripts}       //*[@id="root"]/div/div/div[3]/div/div/div[1]/div[2]/div[1]/div/div[2]/div[1]/div
${Response_amt}              //div[contains(text(),'61208 responses')]
${download_icon}             //*[@id="root"]/div/div/div[3]/div/div[2]/div/div[2]/div/div[1]/div/div[1]/div[2]/div/button
${mailurl}                  https://www.mailinator.com/v4/public/inboxes.jsp?msgid=princeqatest-1638228368-740936&to=newuseremailtest#
${mailbrowser}              chrome
${email_subject}            //td[contains(text(),'Your data export is ready')]
${mail_frame}               //iframe[@id='html_msg_body']
${email_body}               //iframe(text(),'Download')]
${Impacts}                  //li[contains(text(),'Impact')]
${Responses}                //li[contains(text(),'Responses')]
${Comments}                 //li[contains(text(),'Comments')]
${All feedback}             //li[contains(text(),'All feedback')]
${Detailed feedback}        //li[contains(text(),'Detailed feedback')]
${Contact Requests}         //li[contains(text(),'Detailed feedback')]


*** Keywords ***
Inspect Card in Dashboard
     click element                         ${Q&A}
     set selenium implicit wait            5s
     page should contain element           ${Response_amt}
     click element                         ${Automation_scripts}
     set selenium implicit wait            3s
     page should contain                   Automation Scripts

Export Card Trends
    click button                            ${download_icon}
    press keys                              None   ENTER
    set selenium implicit wait               10s
    wait until page contains                URL to the document will be sent to your email.
    close browser


Validate trends download email link
    open browser                         ${mailurl}         ${mailbrowser}
    maximize browser window
    click element                        ${email_subject}
    page should contain                  Your data export has finished. click the Download button below
    select frame                         ${mail_frame}
    click element                        tag:a
    Switch Window                        locator=NEW
    page should contain                  Log in to Lumoa
     close browser


Export card impacts
    click button                            ${download_icon}
    click element                           ${Impacts}
    set selenium implicit wait               10s
    wait until page contains                URL to the document will be sent to your email.
    close browser

Validate impacts email link
    open browser                         ${mailurl}         ${mailbrowser}
    maximize browser window
    click element                        ${email_subject}
    page should contain                  Your data export has finished. click the Download button below
    select frame                         ${mail_frame}
    click element                        tag:a
    Switch Window                        locator=NEW
    page should contain                  Log in to Lumoa
    close browser

Export card responses
    click button                            ${download_icon}
    click element                           ${Responses}
    set selenium implicit wait               10s
    wait until page contains                URL to the document will be sent to your email.
    close browser

Validate responses email link
    open browser                         ${mailurl}         ${mailbrowser}
    maximize browser window
    click element                        ${email_subject}
    page should contain                  Your data export has finished. click the Download button below
    select frame                         ${mail_frame}
    click element                        tag:a
    Switch Window                        locator=NEW
    page should contain                  Log in to Lumoa
    close browser

Export All feedback
    click button                            ${download_icon}
    click element                           ${All feedback}
    set selenium implicit wait               10s
    wait until page contains                URL to the document will be sent to your email.
    close browser

Validate all feedback email link
    open browser                         ${mailurl}         ${mailbrowser}
    maximize browser window
    click element                        ${email_subject}
    page should contain                  Your data export has finished. click the Download button below
    select frame                         ${mail_frame}
    click element                        tag:a
    Switch Window                        locator=NEW
    page should contain                  Log in to Lumoa
    close browser
Export card detailed feedback
    click button                            ${download_icon}
    click element                           ${Detailed feedback}
    set selenium implicit wait               10s
    wait until page contains                URL to the document will be sent to your email.
    close browser

Validate detailed feedback link
    open browser                         ${mailurl}         ${mailbrowser}
    maximize browser window
    click element                        ${email_subject}
    page should contain                  Your data export has finished. click the Download button below
    select frame                         ${mail_frame}
    click element                        tag:a
    set selenium implicit wait           2s
    Switch Window                        locator=NEW
    page should contain                  Log in to Lumoa
    close browser

Export card contact requests
    click button                            ${download_icon}
    click element                           ${Contact Requests}
    set selenium implicit wait               10s
    wait until page contains                URL to the document will be sent to your email.
    close browser

Validate card contact request feedback email link
    open browser                         ${mailurl}         ${mailbrowser}
    maximize browser window
    click element                        ${email_subject}
    page should contain                  Your data export has finished. click the Download button below
    select frame                         ${mail_frame}
    click element                        tag:a
    Switch Window                        locator=NEW
    page should contain                  Log in to Lumoa
    close window