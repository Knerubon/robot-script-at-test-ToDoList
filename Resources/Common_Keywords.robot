*** Settings ***
Library     Selenium2Library

Resource        ../Resources/Common_Repository.robot
Resource        ../Resources/Common_Variables.robot

*** Keywords ***

Open Browser Chrome :
    [Arguments]  ${_url} 
    #  ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
     ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    #  Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors  
    #  Call Method    ${chrome_options}    add_argument    --headless      #run with no web browser
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage  #disable page crash of chrome
    Call Method    ${chrome_options}    add_argument    --no-sandbox  #disable sandbox mode
    Call Method    ${chrome_options}    add_argument    --headless  #run with no web browser
    Create Webdriver    driver_name=Chrome    alias=google    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    Create Webdriver    Chrome   chrome_options=${chrome_options} 
    Go To  ${_url}   
    Maximize Browser Window
    
Verify Element and Should Be Visible :
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}    20s
    Element Should Be Visible  ${locator}     
    Page Should Contain Element  ${locator}    

Verify ListElement Should Be Visible :
    [Arguments]   ${listdata}

    ${Length}   Get Length  ${listdata}
    FOR    ${i}    IN RANGE    ${Length}
        Log  ${listdata[${i}]}
        Wait Until Element Is Visible  ${listdata[${i}]}  10s
        Wait Until Page Contains Element  ${listdata[${i}]}  10s
    END

Input Text :
    [Arguments]   ${locator}  ${inputData}
    Wait Until Element Is Visible  ${locator}   30s
    Input Text  ${locator}  ${inputData}

Add New Item :
    [Arguments]   ${inputData}
    Input Text :  ${box_input_AddItem}  ${inputData}
    Click Element :  ${button_input_AddItem}

Click Element :
    [Arguments]   ${Local}
    Wait Until Element Is Visible  ${Local}  120s
    Wait Until Page Contains Element  ${Local}  60s
    Click Element   ${Local}

Verify Tasks in To-Do Tasks :
    [Arguments]   ${task_name}
    Wait Until Element Is Visible  //label[contains(.,'${task_name}')]  
    Wait Until Page Contains Element  //label[contains(.,'${task_name}')]  

Completed Tasks in To-Do Tasks :
    [Arguments]   ${task_name}
    Verify Tasks in To-Do Tasks :  ${task_name}
    Click Element :  //span[contains(.,'${task_name}')]
    Wait Until Element Is Not Visible  //label[contains(.,'${task_name}')]  
    Element Should Not Be Visible  //label[contains(.,'${task_name}')]  
    
Delete Tasks in To-Do Tasks :
    [Arguments]   ${task_name}
    Verify Tasks in To-Do Tasks :  ${task_name}
    ${for_value}=   Get Element Attribute  //label[contains(.,'${task_name}')]  for
    Log  ${for_value}
    Click Element :  //button[contains(@id,'${for_value}')]
    Element Should Not Be Visible :  ${task_name}

Element Should Not Be Visible :
    [Arguments]   ${task_name}
    Wait Until Element Is Not Visible  //label[contains(.,'${task_name}')]  
    Element Should Not Be Visible  //label[contains(.,'${task_name}')]  
    Wait Until Page Does Not Contain Element  //label[contains(.,'${task_name}')]

Verify Tasks in Completed :
    [Arguments]   ${task_name}
    Wait Until Element Is Visible  //span[contains(.,'done${task_name}')]
    Wait Until Page Contains Element  //span[contains(.,'done${task_name}')]

Clear All Tasks Completed
    @{elements}   Get Webelements    //button[starts-with(@id, '')]
    @{ids}    Evaluate    [elem.get_attribute('id') for elem in $elements]
    Log  ${ids}
    ${Length}   Get Length  ${ids}
    ${Length}   Evaluate    ${Length} - 1
    
    FOR    ${i}    IN RANGE    ${Length}
        
        ${x}  Set Variable  1
        Log  ${ids[${x}]}
        Wait Until Element Is Visible  ${ids[${x}]}  10s
        Wait Until Page Contains Element  ${ids[${x}]}  10s
        Click Element :  //button[contains(@id,'${ids[${x}]}')]

    END

    Element Should Not Be Visible  ${btn_del_completed}
    Wait Until Page Does Not Contain Element  ${btn_del_completed}

# ================================================================================================================================


        