# File-Change-Detector
Monitor a file and notify the user if its content has been modified.
If conifg.txt changes between two checks, the script outputs "File config.txt has been modified"

# What the Script Does

Watches a file for changes using inotifywait.
Whenever the file is modified and saved, it records the time and date of the change.
Stores all change logs in a separate log file.

# Displays a menu with options to:
- Start monitoring the file
- View the log file
- Clear the log file
- Change which file is being monitored
- Exit the program
