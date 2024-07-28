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

