# fileSiphen

fileSiphen is a simple bash script designed to extract and print the first line of a given file, then remove that line from the file. This can be useful for processing files line by line in a sequential manner.

## Getting Started

These instructions will help you get a copy of the project up and running on your local machine for development and testing purposes.

## Prerequisites

Make sure you have the following installed on your system:

    sed command-line utility

## Installation

    Clone the repository to your local machine:

    sh

git clone https://github.com/yourusername/fileSiphen.git
cd fileSiphen

Make the script executable:

sh

    chmod +x fileSiphen.sh

## Usage

The fileSiphen.sh script takes a file as an input, prints the first line of the file, and removes that line from the file.

    Create or obtain a file to use as input, e.g., input.txt.

    Run the script with the file as an argument:

    sh

    ./fileSiphen.sh input.txt

## Example

Suppose input.txt contains the following lines:


    First line
    Second line
    Third line

After running ./fileSiphen.sh input.txt, the output will be:


    First line

And input.txt will be modified to:


    Second line
    Third line

## Script Details

Here is the content of the fileSiphen.sh script:

    #!/bin/bash
    
    # Check if a file name is provided as an argument
    if [ -z "$1" ]; then
        echo "Usage: $0 <filename>"
        exit 1
    fi
    
    input_file="$1"
    
    # Print the first line
    first_line=$(head -n 1 "$input_file")
    echo "$first_line"
    
    # Remove the first line
    sed -i '1d' "$input_file"
