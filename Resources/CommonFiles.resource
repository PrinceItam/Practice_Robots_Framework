*** Settings ***
Documentation      Common keywords required for most Lumoa tests

*** Variables ***
${URL}                    ***
${BROWSER}                chrome
${EMAIL_FIELD}            name:email
${email}                  newuseremailtest@mailinator.com
${NEXT}                   xpath://*[contains(text(),'Next')]
${PASSWORD_FIELD}         name:password
${password}               ***
${Lumoa_logo}              css: #lumoa-logo
${LOGIN}                  xpath://*[contains(text(),'Login')]

*** Keywords ***
Set up Lumoa Environment
    Open Browser                   ${URL}    ${BROWSER}
    maximize browser window
    Set Browser Implicit Wait       5s
    Page Should Contain        Log in to Lumoa


Valid login
    Click Element   ${EMAIL_FIELD}
    Input Text      ${EMAIL_FIELD}            ${email}
    Click Element   ${NEXT}
    set selenium implicit wait          5s
    Click Element   ${PASSWORD_FIELD}
    input password      ${PASSWORD_FIELD}          ${password}
    Click Element   ${LOGIN}

Assert Valid login
    set selenium implicit wait          5s
    Page Should Contain Element         ${Lumoa_logo}

docker pull elgalu/selenium

docker run -d --name=grid -p 4444:24444 -p 5900:25900 \
  -v /dev/shm:/dev/shm --privileged \
  -e SCREEN_WIDTH=1920 -e SCREEN_HEIGHT=1040 \
  elgalu/selenium

docker exec grid wait_all_done 10s

open vnc://:hola@localhost:5900