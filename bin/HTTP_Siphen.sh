#!/usr/bin/env bash

# Source the library file
source ../src/file_operations.sh

# Assign the result of the function to a variable
bingo=$(get_first_line "./testing")

# Remove the first line of the file
remove_first_line "./testing"

# Echo the result
echo "$bingo"
