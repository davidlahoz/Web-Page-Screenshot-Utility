#!/bin/bash

# Default values
filenameOption="title"
urlFile="urls.txt"
outputSpecified=false
inputSpecified=false

# Parse parameters
for arg in "$@"; do
  IFS='=' read -r key value <<< "$arg"
  case "$key" in
    output)
      filenameOption="$value"
      outputSpecified=true
      ;;
    input)
      urlFile="$value"
      inputSpecified=true
      ;;
  esac
done

# Get script name without preceding "./"
scriptName="${0##*/}"

# Print instructions
if ! $inputSpecified; then
  echo -e "\nNote: You can optionally specify a file containing URLs as an input option when running this script."
  echo "Example: $scriptName input=your_urls.txt"
  echo ""
fi

if ! $outputSpecified; then
  echo -e "\nNote: You can optionally specify 'url' as an output option when running this script to save the filenames with the URL instead of the title."
  echo "Example: $scriptName output=url"
  echo ""
fi

# Print parameters
echo -e "Parameter: input=$urlFile"
echo    "Parameter: output=$filenameOption"
echo    "Saving all screenshots in $(pwd)"
echo -e "\nRunning the script now...\n"

# Main loop
x=1
while IFS= read -r line; do
  prefix=$(printf "%04d" "$x")
  filename=$(printf "%s\n" *_"$prefix"_*)
  
  if [ -n "$filename" ]; then
    echo "Skipping index $x because file exists: $filename"
  else
    echo "$line $x"
    node grab_url.js "$x" "$line" "$filenameOption"  # pass the filename option to the Node.js script
  fi
  
  ((x++))
done < "$urlFile"
