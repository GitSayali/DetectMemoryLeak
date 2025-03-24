# Memory Leak Detection with Robot Framework

## Overview
This test suite checks for memory leaks in a specified process running on a Linux machine. It monitors memory usage before and after execution and ensures there isn't significant leakage.

## Prerequisites
- Linux machine
- Robot Framework installed (`pip install robotframework`)
- Process name of the application to monitor

## Installation
Ensure Robot Framework is installed:
```sh
pip install robotframework
```

## Usage
1. Modify the `PROCESS_NAME` variable in the test case to match your application.
2. Update the execution command in `Run Process` if needed.
3. Run the test case with:
```sh
robot memory_leak_test.robot
```

## Test Logic
1. Captures initial memory usage of the process.
2. Runs the application.
3. Waits for execution to stabilize.
4. Captures memory usage again.
5. Fails the test if memory increase exceeds the defined threshold.

## Configuration
- **PROCESS_NAME**: Name of the process to monitor.
- **MEMORY_THRESHOLD**: Maximum allowable memory increase (in MB).
- **SLEEP_TIME**: Time to wait before checking memory again.

## Example Output
```sh
==============================================================================
Memory Leak Test
==============================================================================
Check Memory Leak                                                  | PASS |
------------------------------------------------------------------------------
Memory Leak Test                                                  | PASS |
==============================================================================
```

## Troubleshooting
- Ensure the process name is correct using:
  ```sh
  ps aux | grep <process_name>
  ```
- Adjust the sleep time if the application takes longer to stabilize.
- Run with `--loglevel DEBUG` for detailed output.

## License
MIT License

