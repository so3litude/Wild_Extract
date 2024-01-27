#!/bin/bash

# Function to display script usage
usage() {
  echo "Usage: $0 [-l <file_location>]"
  exit 1
}

# Parse command line options
while getopts "l:" opt; do
  case $opt in
    l)
      location="$OPTARG"
      ;;
    \?)
      usage
      ;;
  esac
done

# Check if the location is provided
if [ -z "$location" ]; then
  echo "Error: File location not provided."
  usage
fi

# Use grep to filter results and sed to remove '*' and '.'
grep -E '^\*\.[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$' "$location" | sed 's/^[*\.]*//'
