# This script is used to generate config files

 #!/bin/bash
 #!/bin/bash
# Script to process config.json.tmpl and generate config.json with substituted values

# Define the substitution values
BUILD_NAME="abc1234"
BUCKET="gcs_mythd_bucket"
PROJECT="my_new_project"
VERSION="v1.0"

# Input and output file names
INPUT_FILE="config.json.tmpl"
OUTPUT_FILE="config.json"

# Check if input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: $INPUT_FILE not found!"
    exit 1
fi

echo "Processing template file: $INPUT_FILE"

# Perform substitutions using sed and save to output file
sed -e "s/_BUILD_NAME_/$BUILD_NAME/g" \
    -e "s/_BUCKET_/$BUCKET/g" \
    -e "s/_PROJECT_/$PROJECT/g" \
    -e "s/_VERSION_/$VERSION/g" \
    "$INPUT_FILE" > "$OUTPUT_FILE"

# Check if the operation was successful
if [ $? -eq 0 ]; then
    echo "Successfully created $OUTPUT_FILE"
    echo "Contents of $OUTPUT_FILE:"
    echo "========================"
    cat "$OUTPUT_FILE"
else
    echo "Error: Failed to process template file"
    exit 1
fi