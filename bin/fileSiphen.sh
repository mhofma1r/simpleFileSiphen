#!bin/bash
# Print the first line
first_line=$(head -n 1 "$input_file")
echo "$first_line"

# Remove the first line
sed -i '1d' "$input_file"
