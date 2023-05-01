*** Variables ***

${To_Do_List}  //h1[contains(.,'To Do List')]

${menu_AddItem}   //a[contains(.,'Add Item')]
${menu_To-DoTasks}  //a[contains(.,'To-Do Tasks')]
${menu_Completed}  //a[contains(.,'Completed')]

@{list_menu}
...  ${menu_AddItem}
...  ${menu_To-DoTasks}
...  ${menu_Completed}

${box_input_AddItem}  id:new-task
${button_input_AddItem}   //button[contains(.,'add')]

@{list_function_Additem}
...  ${box_input_AddItem}
...  ${button_input_AddItem}

${completed-tasks}  id:completed-tasks
${btn_del_completed}  //button[contains(@id,'1')]