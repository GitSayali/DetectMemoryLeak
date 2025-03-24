*** Settings ***
Library           OperatingSystem
Library           Process
Library           String
Library           Collections

*** Variables ***
${PROCESS_NAME}    my_application    # Change this to the actual process name
${MEMORY_THRESHOLD}    10            # Threshold in MB for detecting a leak

*** Test Cases ***
Check Memory Leak
    [Documentation]    Checks if memory usage of a process increases significantly.
    ${mem_before}    Get Memory Usage    ${PROCESS_NAME}
    Run Process    ./run_my_application.sh    shell=True    # Modify as needed
    Sleep    10s    # Allow time for the application to run
    ${mem_after}    Get Memory Usage    ${PROCESS_NAME}
    ${diff}    Evaluate    ${mem_after} - ${mem_before}
    Should Be True    ${diff} <= ${MEMORY_THRESHOLD}    Memory leak detected! Increase: ${diff} MB

*** Keywords ***
Get Memory Usage
    [Arguments]    ${process_name}
    ${output}    Run Process    ps -o rss= -C ${process_name}    shell=True
    ${memory}    Evaluate    int(${output.strip()}) / 1024    # Convert KB to MB
    [Return]    ${memory}
