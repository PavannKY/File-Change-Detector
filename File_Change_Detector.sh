#!/bin/sh

FILE=""
LOG=""

monitor_file() {
    if [ ! -f "$FILE" ]; then
        echo "File '$FILE' not found."
        return
    fi

    echo "Monitoring '$FILE'..."
    while true; do
        inotifywait -e close_write "$FILE" > /dev/null 2>&1
        TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
        echo "[$TIMESTAMP] file '$FILE' has been modified" >> "$LOG"
        echo "[$TIMESTAMP] file '$FILE' has been modified"
        sleep 1
done
}

show_log() {
    echo "---- Change Log ----"
    if [ -f "$LOG" ]; then
        cat "$LOG"
    else
        echo "Log file not found."
    fi
}

clear_log() {
    if [ -f "$LOG" ]; then
        > "$LOG"
        echo "Log file has been cleared."
    else
        echo "Log file does not exist yet."
    fi
}

change_file() {
    echo "Enter new file path:"
    read NEWFILE
    FILE="$NEWFILE"
    echo "File to monitor updated to: $FILE"
}

while true; do
    echo ""
    echo "-----------------------------------"
    echo "         File Watcher Menu"
    echo "-----------------------------------"
    echo "1. Monitor File"
    echo "2. View Log"
    echo "3. Clear Log File"
    echo "4. Change File to Monitor"
    echo "5. Exit"
    echo "-----------------------------------"
    printf "Choose an option: "
    read CH

    case $CH in
        1) monitor_file ;;
        2) show_log ;;
        3) clear_log ;;
        4) change_file ;;
        5) echo "Goodbye."; exit 0 ;;
        *) echo "Invalid choice. Try again." ;;
    esac
done
