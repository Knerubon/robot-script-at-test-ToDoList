*** Settings ***
Metadata         Version 1.0.0

Resource        ../Resources/Common_Keywords.robot
Resource        ../Resources/Common_Repository.robot
Resource        ../Resources/Common_Variables.robot

# Test Teardown       Close All Browsers

*** Test Cases ***

001:Open_web_and_verify_home_page
        [Tags]      positive
        [Documentation]
        ...     - Title Visible : TO DO LIST ${\n}
        ...     - Menu Visible :  Add Item , TO-DO Tasks , Completed ${\n}
        ...     - Function add-item Visible : box input , button add ${\n}
    
    Open Browser Chrome :  ${URL_TDL_Test}
    Verify Element and Should Be Visible :  ${To_Do_List}
    Verify ListElement Should Be Visible :  ${list_menu}
    Verify ListElement Should Be Visible :  ${list_function_Additem}

    Capture Page Screenshot   ${path_result}/1 Open web and verify home page.png

002:Create_Tasks_and_verify_Tasks
        [Tags]      positive
        [Documentation]
        ...     - Create tasks ${\n}
        ...     - Verify tasks : new tasks visible  ${\n}
    
    # Open Browser Chrome :  ${URL_TDL_Test}
    # Verify Element and Should Be Visible :  ${To_Do_List}
    #-------------------------------------------------------------------------------
    # Create tasks
    Add New Item :  ${tesk_1}
    Add New Item :  ${tesk_2}
    # Verify tasks
    Click Element :  ${menu_To-DoTasks}
    Verify Tasks in To-Do Tasks :  ${tesk_1}
    Verify Tasks in To-Do Tasks :  ${tesk_2}

    Capture Page Screenshot   ${path_result}/2 Create Tasks.png

003:Delete_Tasks_and_Verify_Tasks
        [Tags]      positive
        [Documentation]
        ...     - Delete tasks in menu TO-DO Tasks ${\n}
        ...     - Verify tasks : not tasks del in menu TO-DO Tasks and Completed ${\n}
    
    # Open Browser Chrome :  ${URL_TDL_Test}
    # Verify Element and Should Be Visible :  ${To_Do_List}
    # Create tasks
    # Add New Item :  ${tesk_1}
    # Add New Item :  ${tesk_2}
    # # Verify tasks
    # Click Element :  ${menu_To-DoTasks}
    #-------------------------------------------------------------------------------
    Capture Page Screenshot   ${path_result}/3.1 Before Delete Tasks.png
    # Delete tasks
    Delete Tasks in To-Do Tasks :  ${tesk_1}      # del by tesk_name
    Delete Tasks in To-Do Tasks :  ${tesk_2}      # del by tesk_name  
    Capture Page Screenshot   ${path_result}/3.2 After Delete Tasks in menu TO-DO Tasks.png
    Click Element :  ${menu_Completed}
    Element Should Not Be Visible :  ${tesk_1}
    Element Should Not Be Visible :  ${tesk_2}
    Capture Page Screenshot   ${path_result}/3.3 After Delete Tasks in menu Completed.png

004:Completed_Tasks_and_verify_Tasks_Completed
        [Tags]      positive
        [Documentation]
        ...     - Completed tasks in menu TO-DO Tasks ${\n}
        ...     - verify tasks completed : not tasks in menu TO-DO Tasks and task move menu Completed ${\n}
    
    # Open Browser Chrome :  ${URL_TDL_Test}
    # Verify Element and Should Be Visible :  ${To_Do_List}
    #-------------------------------------------------------------------------------
    # Create
    Click Element :  ${menu_AddItem}
    Add New Item :  ${tesk_1}
    Add New Item :  ${tesk_2}
    # Verify tasks
    Click Element :  ${menu_To-DoTasks}
    Capture Page Screenshot   ${path_result}/4.1 verify Tasks Before Completed.png
    Completed Tasks in To-Do Tasks :  ${tesk_1}
    Completed Tasks in To-Do Tasks :  ${tesk_2}
    # Verify completed tasks
    Click Element :  ${menu_Completed}
    Verify Tasks in Completed :  ${tesk_1}
    Verify Tasks in Completed :  ${tesk_2}

    Capture Page Screenshot   ${path_result}/4.2 verify Tasks Completed.png

005:Clear_All_Tasks_Completed
        [Tags]      positive
        [Documentation]
        ...     - Clear all tasks completed : not task menu completed${\n}
    
    # Open Browser Chrome :  ${URL_TDL_Test}
    # Verify Element and Should Be Visible :  ${To_Do_List}
    # Create
    # Add New Item :  ${tesk_1}
    # Add New Item :  ${tesk_2}
    # Verify tasks
    # Click Element :  ${menu_To-DoTasks}
    # Completed Tasks in To-Do Tasks :  ${tesk_1}
    # Completed Tasks in To-Do Tasks :  ${tesk_2}
    # Verify completed tasks
    # Click Element :  ${menu_Completed}
    # Verify Tasks in Completed :  ${tesk_1}
    # Verify Tasks in Completed :  ${tesk_2}
    #-------------------------------------------------------------------------------
    Capture Page Screenshot   ${path_result}/5.1 Verify Tasks Completed.png
    # Delete tasks
    Clear All Tasks Completed     

    Capture Page Screenshot   ${path_result}/5.2 Delete Tasks Completed.png
