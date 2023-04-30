#!/bin/sh

# Set the FILES_DIR and SEARCH_STR variables using command line arguments
FILES_DIR="$1"
SEARCH_STR="$2"

# Check that both arguments were provided
if [ $# -lt 2 ]; then
	echo "Error: both arguments not specified"
	exit 1
fi

# Check that FILES_DIR exists and is a directory
if [ ! -d "$FILES_DIR" ]; then
	echo "Error: specified directory $FILES_DIR not found"
	exit 1
fi

# Count the number of files in the directory
NUM_FILES=$(find "$FILES_DIR" -type f | wc -l)
NUM_MATCHED=$(grep -rn "$SEARCH_STR" "$FILES_DIR" | wc -l)
# Print the results
echo "The number of files are $NUM_FILES and the number of matching lines are $NUM_MATCHED"
