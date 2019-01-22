#!/bin/sh

# All variables must be defined below
#-i    input file
#-o    output file
#-d    day of election
#-m    month of election
#-y    year of election
#-c    column where date of births are specified in 'year-month-day' order

# run Python Script
python3 python/findAge.py -i "example.csv" -o "test.csv" -c 1 -d 11 -m 10 -y 2018

# run R script
R -e 'source("R/ageRange.R")'
