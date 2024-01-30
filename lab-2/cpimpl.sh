#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_file> <destination_path>"
    exit 1
fi

source_file=$1
destination_path=$2

if [ ! -e "$source_file" ]; then
    echo "Error: Source file '$source_file' not found."
    exit 1
fi

if [ ! -d "$destination_path" ]; then
    echo "Error: Destination path '$destination_path' is not a directory."
    exit 1
fi

filename=$(basename "$source_file")

destination="$destination_path/$filename"

cp "$source_file" "$destination"

echo "File '$source_file' copied to '$destination'."

