#!/bin/sh

FILE="/home/pavanky/Desktop/file.txt"

if [ ! -f "$FILE" ]; then
	echo "File '$FILE' not found"
	exit 1
fi

echo "Monitoring '$FILE'..."

while true; do
	inotifywait -e close_write "$FILE" > /dev/null 2>&1

	TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
	echo "[$TIMESTAMP] file '$FILE' has been modified" >> /home/pavanky/Desktop/file_changes.log
	echo "[$TIMESTAMP ] file '$FILE' has been modified"
done
