#!/bin/bash

# Function to print the first line of a file
get_first_line() {
  local input_file="$1"
  if [[ ! -f "$input_file" ]]; then
    echo "File not found: $input_file"
    return 1
  fi
  head -n 1 "$input_file"
}

# Function to remove the first line of a file
remove_first_line() {
  local input_file="$1"
  sed -i '1d' "$input_file"
}

flush_binary_file_to() { 
    local SRC_FILE="$1"
    local DST_FILE="$2"

    # Validate that the destination file is specified
    if [[ -z "$DST_FILE" ]]; then
        echo "Error: Destination file is not specified."
        return 1
    fi

    # Ensure destination file exists or create it
    if [[ ! -e "$DST_FILE" ]]; then
        touch "$DST_FILE" || { echo "Error: Failed to create $DST_FILE"; return 1; }
    fi

    # Append content of SRC to DST
    if [[ -f "$SRC_FILE" ]]; then
        if ! utmpdump "$SRC_FILE" >> "$DST_FILE"; then
            echo "Error: Failed to process $SRC_FILE with utmpdump."
            return 1
        fi
        # Uncomment the following line after testing
        # truncate -s 0 "$SRC_FILE"
    else
        echo "Error: Source file $SRC_FILE does not exist."
        return 1
    fi

    return 0
}
