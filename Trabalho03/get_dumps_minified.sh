#!/bin/bash

# Define source and destination directories
SOURCE_DIR="mbdump/mbdump"
DEST_DIR="dumps"

# Default row count is 1000
ROW_COUNT=1000
# Ideally it would be at least 119489 (number of rows in area table)

# If an argument is provided, use it as the row count
if [[ $# -ge 1 ]]; then
  ROW_COUNT=$1
fi

# Check if the source directory exists
if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Error: Source directory '$SOURCE_DIR' does not exist."
  echo "Please download the required data from:"
  echo "https://data.metabrainz.org/pub/musicbrainz/data/fullexport/"
  echo "Remember to extract its files before running this script."
  read -p "Press enter to continue..."
  exit 1
fi

# Ensure the destination directory exists
mkdir -p "$DEST_DIR"

# List of table files to process
tables=(
  "area_type"
  "area"
  "artist"
  "artist_type"
  "event_type"
  "event"
  "gender"
  "genre"
  "instrument_type"
  "instrument"
)

# Loop through each table and copy the first 1000 lines
for table in "${tables[@]}"; do
  input_file="$SOURCE_DIR/$table"
  output_file="$DEST_DIR/$table"
  
  # Check if the source file exists
  if [[ -f "$input_file" ]]; then
    echo "Processing $table..."
    head -n $ROW_COUNT "$input_file" > "$output_file"
    echo "Copied first $ROW_COUNT rows of $table to $output_file"
  else
    echo "Source file $input_file does not exist, skipping $table"
  fi
done

echo "Processing complete."

read -p "Press enter to continue..."
