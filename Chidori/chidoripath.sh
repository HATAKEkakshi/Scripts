#!/bin/bash

# Define the file name
file="path.txt"

# Function to read from the file and store in a variable
read_file() {
    if [ -f "$file" ]; then
        file_content=$(<"$file")
        echo $file_content
    else
        file_content="File $file does not exist."
    fi
}

# Function to write to the file
write_to_file() {
    echo "Enter path of the Scripts folder:"
    read input_text
    echo "$input_text" > "$file"
    echo "Path Succesfully saved to : $file."
}

# Main function
write_to_file

