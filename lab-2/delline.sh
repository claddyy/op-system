#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file_name> <line_number>"
    exit 1
fi

file_name=$1
line_number=$2

if [ ! -e "$file_name" ]; then
    echo "Error: File '$file_name' does not exist."
    exit 1
fi

if ! [[ "$line_number" =~ ^[0-9]+$ ]]; then
    echo "Error: Line number must be a positive integer."
    exit 1
fi

sed -i "${line_number}d" "$file_name"

echo "Line $line_number deleted from $file_name."

