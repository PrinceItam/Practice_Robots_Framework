*** Settings ***
Library   SeleniumLibrary
Library    FakerLibrary
Library    Telnet
Library    ListenerLibrary


*** Variables ***
${URL}                      https://stage-surveys.lumoa.me/developer-stage-company/sentimemt-load-test
#${URL}                       https://test-surveys.lumoa.me/developer-test-company-ltd/test-qa
${BROWSER}                   edge
${score}                    //span[contains(text(),'9')]
${Survey_Question}          //*[contains(text(),'How many times do you use Lumoa single import API ')]
#${Survey_Question}          //*[contains(text(),'Hello can you rate Lumoa?')]
${Input_feedback}           //body/div[@id='surveyFormRoot']/div[1]/div[1]/div[2]/form[1]/div[2]/div[1]/div[1]/div[1]/textarea[1]
${send}                     //span[contains(text(),'Send')]
#${Feedback_Sent}            //h5[contains(text(),'Confirmation Send')]
${Feedback_Sent}            //h5[contains(text(),'Positive')]



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
    Input Text                              ${Input_feedback}  ${feedback}

user clicks on send button
    click element                          ${send}
    wait until element is visible          ${Feedback_Sent}
    close window


survey should be sent sucessfully
    page should contain element                  ${Feedback_Sent}
