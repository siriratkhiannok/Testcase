*** Settings ***
Library             SeleniumLibrary
Suite Setup         Open Browser     http://automationexercise.com     chrome
Suite Teardown      Close Browser
 
*** Variables ***
${NAME}             John Doe
${EMAIL}            johndoe@example.com
${SUBJECT}          Inquiry
${MESSAGE}          I would like to inquire about your services.
${FILE_PATH}        /path/to/your/file.txt  
 
*** Keywords ***
Input Name
    [Arguments]        ${NAME}
    Input Text         //*[@id="contact-name"]    ${NAME}
 
Input Email
    [Arguments]        ${EMAIL}
    Input Text         //*[@id="contact-email"]   ${EMAIL}
 
Input Subject
    [Arguments]        ${SUBJECT}
    Input Text         //*[@id="contact-subject"]   ${SUBJECT}
 
Input Message
    [Arguments]        ${MESSAGE}
    Input Text         //*[@id="contact-message"]   ${MESSAGE}
 
Upload File
    [Arguments]        ${FILE_PATH}
    Choose File        //*[@id="contact-file"]   ${FILE_PATH}
 
Click Submit Button
    Click Button       //*[@id="contact-submit"]
 
Click OK Button
    Wait Until Element Is Visible    //*[@id="submit-success"]  
    Click Button       //*[@id="submit-success"]

 
*** Test Cases ***
Test Contact Us Form
    [Documentation]    Test the 'Contact Us' form submission process on the home page
    Open Browser       http://automationexercise.com   chrome
    Maximize Browser Window

    Title Should Be    Automation Exercise
 

    Click Element      //*[@href='/contact_us'] 
 

    Page Should Contain Element     //*[@id="contact-page"]/div[2]/div[1]/div/h2/text()


 

    Input Name         ${NAME}
    Input Email        ${EMAIL}
    Input Subject      ${SUBJECT}
    Input Message      ${MESSAGE}
 

    Upload File        ${FILE_PATH}
 

    Click Submit Button
 

    Click OK Button
 

    Page Should Contain    Success! Your details have been submitted successfully.
 

    Click Element      //*[@href='/']
    Page Should Contain    Automation Exercise

