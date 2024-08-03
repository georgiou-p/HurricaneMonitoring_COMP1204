#!/bin/bash

#check if input and output file parameters are provided
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 input_file output_file.csv"
	exit 1
fi

echo "Converting $1 --> $2"

#Extract data from input file
timestamp=$(cat "$1" | grep 'UTC' | sed 's/.*\([0-9]\{4\} UTC [A-Z]\{3\} [0-9]\{2\}\).*/\1/' | uniq)
latitude=$(grep -Eo '[-]?[0-9]+\.[0-9]+ N' "$1")
longitude=$(grep -Eo '[-]?[0-9]+\.[0-9]+ W' "$1")
minSeaLevel=$(grep -Eo '[0-9]+ mb' "$1")
knots=$(grep -Eo '[0-9]+ knots' "$1")

#Combine data
output=$(paste -d "," <(echo "$timestamp") <(echo "$latitude") <(echo "$longitude") <(echo "$minSeaLevel") <(echo "$knots"))

#Add commas and spaces after each variable
output=$(echo "$output" | awk 'BEGIN { FS=","; OFS="," } {print $1, $2, $3, $4, $5}')

#Add header
header="Timestamp,Latitude,Longitude,MinSeaLevelPressure,MaxIntensity"

#Write data to output CSV file
echo "$header" > "$2"
echo "$output" | sed 's/\t/,/g' >> "$2"

echo "Done!"
