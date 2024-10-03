#!/bin/bash
file="doc.txt"

# Read each line from the file
while IFS= read -r  f1
do
    # Process each line as needed
    echo "Read line: $f1 "

    echo "------------------"  # Add a separator
done < doc.txt

#Specify the file path
# file="/etc/passwd"

# # Read each line from the file
# while IFS=: read -r  f1 f2 f3; do
#     # Process each line as needed
#     echo "Read line: $f1 $f2 $f3"

#     echo "------------------"  # Add a separator
# done < "$file"

# for file in $(find / -name "*.jpg" -type f)
# do
#     echo "Processing file: $file"
#     cp $file obrazky/
# done







# v podmínce if pokud str tak (()) a pokud číslo [[]]


# script najde .txt a napíše do nich něco


