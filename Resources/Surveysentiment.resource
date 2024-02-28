*** Settings ***
Library   Selenium2Library
Library    FakerLibrary
Library   Telnet


*** Variables ***
${URL}                      https://stage-surveys.lumoa.me/qa-automation-company/qa-scripts-dont-delete
${BROWSER}                   chrome
${score}                    //span[contains(text(),'4')]
${Survey_Question}          //*[contains(text(),'Decide why Lumoa is the best Company in the world and why you use Lumoa CX platform')]
${Input_feedback}           //body/div[@id='surveyFormRoot']/div[1]/div[1]/div[2]/form[1]/div[2]/div[1]/div[1]/div[1]/textarea[1]
${send}                     //span[contains(text(),'Send')]
${Feedback_Sent}            //h5[contains(text(),'Thank you for your feedback')]
${score2}                   //span[contains(text(),'2')]



*** Keywords ***
open link Campaign
   open browser                             ${URL}   ${BROWSER}
   maximize browser window
   wait until element is visible            ${Survey_Question}
   page should contain element              ${Survey_Question}

select a rating score
     click element                          ${score}

add feedback comment
    mouse down                              ${Input_feedback}
    ${feedback}                             FakerLibrary.Sentence
    log                                     ${feedback}
    Set Test Variable                       ${feedback}
    Input Text                              ${Input_feedback}     ${feedback}

user clicks on send button
    click element                          ${send}
    wait until element is visible          ${Feedback_Sent}

survey should be sent sucessfully
    page should contain element            ${Feedback_Sent}
    reload page
    wait until element is enabled         ${score2}    5s
test survey without comment
     click element                         ${score2}
    click element                          ${send}
    wait until element is visible          ${Feedback_Sent}


